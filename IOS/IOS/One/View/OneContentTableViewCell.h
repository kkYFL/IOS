//
//  OneContentTableViewCell.h
//  IOS
//
//  Created by 杨丰林 on 2019/1/9.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OneContentTableViewCell : UITableViewCell
@property (nonatomic, copy) void (^contentCellBlock)(NSString *content);
@end
