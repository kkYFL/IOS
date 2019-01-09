//
//  UIViewController+EWTRuntime.m
//  Ewt360
//
//  Created by Tony on 2017/10/25.
//  Copyright © 2017年 铭师堂. All rights reserved.
//

#import "UIViewController+EWTRuntime.h"
#import "NSObject+EWTRuntime.h"

@implementation UIViewController (EWTRuntime)

+(void)load{
    
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        [NSObject swizzleWithClass:[self class] originalSelector:@selector(viewWillAppear:) newSelector:@selector(ewt_viewWillAppear:)];
        
        [NSObject swizzleWithClass:[self class] originalSelector:@selector(viewWillDisappear:) newSelector:@selector(ewt_viewWillDisappear:)];
        
        [NSObject swizzleWithClass:[self class] originalSelector:NSSelectorFromString(@"dealloc") newSelector:@selector(ewt_dealloc)];
    });
}

-(void)ewt_viewWillAppear:(BOOL)animated{
    
    // do some you want to do  hook
    
    [self ewt_viewWillAppear:animated];
}

-(void)ewt_viewWillDisappear:(BOOL)animated{
    
    // do some you want to do  hook
    
    [self ewt_viewWillDisappear:animated];
}

-(void)ewt_dealloc{
    
    NSLog(@"---dealloc controller : %@----",[NSString stringWithUTF8String:object_getClassName(self)]);
    
    [self ewt_dealloc];
}
@end
