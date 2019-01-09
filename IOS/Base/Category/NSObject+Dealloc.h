//
//  NSObject+Dealloc.h
//  Ewt360
//
//  Created by 李天露 on 2018/2/13.
//  Copyright © 2018年 铭师堂. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^DeallocCallback)();

@interface NSObject (Dealloc)

@property (nonatomic, copy) DeallocCallback deallocCallback;

@end
