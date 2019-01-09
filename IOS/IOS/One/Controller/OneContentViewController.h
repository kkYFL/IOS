//
//  OneContentViewController.h
//  IOS
//
//  Created by 杨丰林 on 2019/1/9.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import "YFLBaseViewController.h"

@interface OneContentViewController : YFLBaseViewController
@property (nonatomic, copy) void (^contentBlock) (NSString *content);
@end
