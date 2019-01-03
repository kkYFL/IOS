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


// 导航栏右按钮(只有文字)
#define NAVIGATION_BAR_RIGHT_BUTTON_ONLYTEXT(x, y, w, h, normal, selected, sel)\
{\
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
button.frame = CGRectMake(x, y, w, h);\
[button setTitle:normal forState:UIControlStateNormal];\
[button setTitle:selected forState:UIControlStateSelected];\
[button.titleLabel setFont:[UIFont systemFontOfSize:16]];\
[button setTitleColor:[UIColor colorWithHexString:@"#FFFFFF"] forState:UIControlStateNormal];\
[button addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];\
self.navigationItem.rightBarButtonItem = buttonItem;\
}

// 导航栏右按钮(只有文字)
#define NAVIGATION_BAR_RIGHT_BUTTON_COLORTEXT(x, y, w, h, normal, selected, sel, color)\
{\
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
button.frame = CGRectMake(x, y, w, h);\
[button setTitle:normal forState:UIControlStateNormal];\
[button setTitle:selected forState:UIControlStateSelected];\
[button.titleLabel setFont:[UIFont systemFontOfSize:14]];\
[button setTitleColor:[UIColor colorWithHexString:color] forState:UIControlStateNormal];\
[button addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];\
self.navigationItem.rightBarButtonItem = buttonItem;\
}


// 导航栏右按钮
#define NAVIGATION_BAR_RIGHT_BUTTON(x, y, w, h, normal, selected, sel)\
{\
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
button.frame = CGRectMake(x, y, w, h);\
[button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];\
[button setImage:[UIImage imageNamed:selected] forState:UIControlStateHighlighted];\
[button addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];\
self.navigationItem.rightBarButtonItem = buttonItem;\
}


// 导航栏右按钮---图片加文字
#define NAVIGATION_BAR_RIGHT_BUTTON_TITLE_AND_IMAGE(x, y, w, h, normal, selected, title ,sel)\
{\
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
button.frame = CGRectMake(x, y, w, h);\
[button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];\
[button setImage:[UIImage imageNamed:selected] forState:UIControlStateHighlighted];\
[button setTitle:title forState:UIControlStateNormal];\
[button.titleLabel setFont:[UIFont systemFontOfSize:15]];\
button.contentEdgeInsets = UIEdgeInsetsMake(0,30, 0, 0);\
button.imageEdgeInsets = UIEdgeInsetsMake(0,-10, 0, 0);\
[button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];\
[button setTitleColor:RGB(61, 105, 150) forState:UIControlStateHighlighted];\
[button addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];\
self.navigationItem.rightBarButtonItem = buttonItem;\
}




// 导航栏左按钮，使用CustomView来自定义返回图标
#define NAVIGATION_BAR_LEFT_BUTTON(x, y, w, h, normal, selected, sel)\
{\
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
button.frame = CGRectMake(x, y, w, h);\
[button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];\
[button setImage:[UIImage imageNamed:selected] forState:UIControlStateHighlighted];\
[button addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];\
self.navigationItem.leftBarButtonItem = buttonItem;\
}

// 导航栏左按钮，自定义返回图标，这种可以通过修改leftBarButtonItem的tintColor来改变返回图标颜色
#define EWTModifyNavigationBarLeftBarButtonItemWithImage(imageName, sel)\
{\
UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStylePlain target:self action:sel];\
self.navigationItem.leftBarButtonItem = backBarButtonItem;\
}

// 导航栏左按钮
#define NAVIGATION_BAR_LEFT_BUTTON_ADJUST(x, y, w, h, normal, selected, sel)\
{\
UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];\
button.frame = CGRectMake(x, y, w, h);\
button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 28);\
[button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];\
[button setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];\
[button addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];\
self.navigationItem.leftBarButtonItem = buttonItem;\
}

// 导航栏左按钮(消息)
#define NAVIGATION_BAR_LEFT_BUTTON_MSGCOUNT(x, y, w, h, normal, selected, sel)\
{\
MsgCountButton *button = [MsgCountButton buttonWithType:UIButtonTypeCustom];\
button.frame = CGRectMake(x, y, w, h);\
[button setImage:[UIImage imageNamed:normal] forState:UIControlStateNormal];\
[button setImage:[UIImage imageNamed:selected] forState:UIControlStateSelected];\
button.tag = 101;\
[button addTarget:self action:@selector(sel) forControlEvents:UIControlEventTouchUpInside];\
UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithCustomView:button];\
self.navigationItem.leftBarButtonItem = buttonItem;\
}



#endif /* YFLBase_h */
