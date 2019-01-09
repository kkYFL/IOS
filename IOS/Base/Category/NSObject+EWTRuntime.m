//
//  NSObject+EWTRuntime.m
//  Ewt360
//
//  Created by Tony on 2017/10/25.
//  Copyright © 2017年 铭师堂. All rights reserved.
//

#import "NSObject+EWTRuntime.h"
#import <objc/runtime.h>

const char *kEWTDebounceDictionary;
static dispatch_semaphore_t semephore;

@implementation NSObject (EWTRuntime)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject swizzleWithClass:NSClassFromString(@"NSConcreteFileHandle") originalSelector:@selector(writeData:) newSelector:NSSelectorFromString(@"ewt_writeData:")];
        semephore = dispatch_semaphore_create(1);
    });
}

+ (void)swizzleWithClass:(Class)classType originalSelector:(SEL)originalSel newSelector:(SEL)newSel {
    Method originalMethod = class_getInstanceMethod(classType, originalSel);
    Method newMethod = class_getInstanceMethod(classType, newSel);
    IMP newMethodImp = method_getImplementation(newMethod);
    IMP originalMethodImp = method_getImplementation(originalMethod);
    
    BOOL addMethodSuccess = class_addMethod(classType, originalSel, newMethodImp, method_getTypeEncoding(newMethod));
    
    if (addMethodSuccess) {
        class_replaceMethod(classType, newSel, originalMethodImp, method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

#pragma mark - 方法调用防抖

- (void)ewt_performSelector:(SEL)selector withObject:(id)obj debounce:(NSTimeInterval)debounce {
    dispatch_semaphore_wait(semephore, DISPATCH_TIME_FOREVER);
    NSMutableDictionary *debouncedSelectors = objc_getAssociatedObject(self, &kEWTDebounceDictionary);
    if (!debouncedSelectors) {
        debouncedSelectors = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &kEWTDebounceDictionary, debouncedSelectors, OBJC_ASSOCIATION_RETAIN);
    }
    
    BOOL isDebouncing = [debouncedSelectors objectForKey:NSStringFromSelector(selector)];
    if (!isDebouncing) {
        [debouncedSelectors setObject:@(YES) forKey:NSStringFromSelector(selector)];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:selector withObject:obj];
#pragma clang diagnostic pop
        
        // set debounce timer
        dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, debounce * NSEC_PER_SEC);
        dispatch_after(time, dispatch_get_global_queue(0, 0), ^{
            [self debouncingTimeOverWithSelector:selector];
        });
    } else {
        // current is debounding skip this method call
    }
    dispatch_semaphore_signal(semephore);
}

- (void)debouncingTimeOverWithSelector:(SEL)selector {
    dispatch_semaphore_wait(semephore, DISPATCH_TIME_FOREVER);
    NSMutableDictionary *debouncedSelectors = objc_getAssociatedObject(self, &kEWTDebounceDictionary);
    [debouncedSelectors removeObjectForKey:NSStringFromSelector(selector)];
    dispatch_semaphore_signal(semephore);
}

@end
