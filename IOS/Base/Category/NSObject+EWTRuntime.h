//
//  NSObject+EWTRuntime.h
//  Ewt360
//
//  Created by Tony on 2017/10/25.
//  Copyright © 2017年 铭师堂. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (EWTRuntime)

+ (void)swizzleWithClass:(Class)classType originalSelector:(SEL)originalSel newSelector:(SEL)newSel;

/**
 防抖调用

 @param selector 方法
 @param obj      参数
 @param debounce 防抖间隔 单位秒
 */
- (void)ewt_performSelector:(SEL)selector withObject:(id)obj debounce:(NSTimeInterval)debounce;

@end
