//
//  NSObject+Dealloc.m
//  Ewt360
//
//  Created by 李天露 on 2018/2/13.
//  Copyright © 2018年 铭师堂. All rights reserved.
//

#import "NSObject+Dealloc.h"
#import "NSObject+EWTRuntime.h"
#import <objc/runtime.h>

@implementation NSObject (Dealloc)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [NSObject swizzleWithClass:NSClassFromString(@"NSObject") originalSelector:NSSelectorFromString(@"dealloc") newSelector:@selector(myDealloc)];
    });
}

- (void)myDealloc
{
    DeallocCallback callback = [self deallocCallback];
    if (callback) {
        callback();
    }
    
    [self myDealloc];
}

- (void)setDeallocCallback:(DeallocCallback)callback
{
    objc_setAssociatedObject(self, _cmd, callback, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (DeallocCallback)deallocCallback
{
    return objc_getAssociatedObject(self, @selector(setDeallocCallback:));
}


@end
