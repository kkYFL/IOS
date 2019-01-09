//
//  YFLBaseViewController.m
//  IOS
//
//  Created by 杨丰林 on 2018/12/29.
//  Copyright © 2018年 杨丰林. All rights reserved.
//

#import "YFLBaseViewController.h"
#import "AppDelegate.h"

@interface YFLBaseViewController ()

@end

@implementation YFLBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"VC_APPEAR : %@\n", NSStringFromClass(self.class));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
