//
//  UIImage+YFL.m
//  IOS
//
//  Created by 杨丰林 on 2019/1/23.
//  Copyright © 2019年 杨丰林. All rights reserved.
//

#import "UIImage+YFL.h"
#import <objc/runtime.h>

@implementation UIImage (YFL)
+(void)load{
    Method originMethodName = class_getClassMethod(self, @selector(imageNamed:));
    Method latestMethodName = class_getClassMethod(self, @selector(imageWithName:));
    method_exchangeImplementations(originMethodName, latestMethodName);
}


+(instancetype)imageWithName:(NSString *)name{
    UIImage *image = [self imageWithName:name];
    NSLog(@"方法交换！-----");
    return image;
}
@end
