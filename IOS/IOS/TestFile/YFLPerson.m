//
//  YFLPerson.m
//  IOS
//
//  Created by 杨丰林 on 2019/1/25.
//  Copyright © 2019年 杨丰林. All rights reserved.
//

#import "YFLPerson.h"
#import <objc/runtime.h>

@implementation YFLPerson
+(BOOL)resolveInstanceMethod:(SEL)sel{
    //
    if ([NSStringFromSelector(sel) isEqualToString:@"eat"]) {
        class_addMethod(self, sel, (IMP)eat, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}

// 4. eat方法实现
void eat(id self, SEL _cmd) {
    NSLog(@"执行了吧, 啦啦啦啦");
}

@end
