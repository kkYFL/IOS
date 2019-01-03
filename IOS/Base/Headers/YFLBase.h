//
//  YFLBase.h
//  IOS
//
//  Created by 杨丰林 on 2019/1/3.
//  Copyright © 2019年 杨丰林. All rights reserved.
//

#ifndef YFLBase_h
#define YFLBase_h

// RGB颜色
#define RGB(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

// 状态栏高度
#define EWTStatusBar_Height ([UIScreen mainScreen].bounds.size.height == 812.0 ? 44.0:20.0)

// 导航栏高度
#define EWTNavigation_Bar_Height 44.0

// 底部安全边界
#define EWTTabbar_SafeBottomMargin ([UIScreen mainScreen].bounds.size.height == 812.0 ?34.0:0)

// 导航栏高度 + 状态栏目高度
#define NAVIGATION_BAR_HEIGHT ([UIScreen mainScreen].bounds.size.height == 812.0 ? 88:64)

// 标签栏高度 + 虚拟home区域高度
#define TAB_BAR_HEIGHT ([UIScreen mainScreen].bounds.size.height == 812.0 ? 83:49)

// 判断iPhoneX
#define KISIphoneX (CGSizeEqualToSize(CGSizeMake(375.f, 812.f), [UIScreen mainScreen].bounds.size) || CGSizeEqualToSize(CGSizeMake(812.f, 375.f), [UIScreen mainScreen].bounds.size))

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define WIDTH_SCALE [UIScreen mainScreen].bounds.size.width/375.0
#define HEIGHT_SCALE [UIScreen mainScreen].bounds.size.height/667.0



#endif /* YFLBase_h */
