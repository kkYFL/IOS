//
//  ChartViewController.m
//  IOS
//
//  Created by 杨丰林 on 2019/10/24.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import "ChartViewController.h"
#import "ChartLayoutView.h"

@interface ChartViewController ()

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"chart";

    
    ChartLayoutView *chart = [[ChartLayoutView alloc]initWithFrame:CGRectMake(12.0f, 100, SCREEN_WIDTH-24.0f, 211.0f)];
    [self.view addSubview:chart];
    

    
}


@end
