//
//  Chart1ViewController.m
//  IOS
//
//  Created by 杨丰林 on 2019/10/25.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import "Chart1ViewController.h"
#import "ChartView1.h"

@interface Chart1ViewController ()

@end

@implementation Chart1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"chart1";


    ChartView1 *charView = [[ChartView1 alloc]initWithFrame:CGRectMake(12, 100, SCREEN_WIDTH-24.0, 208.0f)];
    charView.backgroundColor = [UIColor colorWithRed:249/255.0 green:249/255.0 blue:250.0/255.0 alpha:1];
    [self.view addSubview:charView];
    
}


@end
