//
//  OneContentViewController.m
//  IOS
//
//  Created by 杨丰林 on 2019/1/9.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import "OneContentViewController.h"
#import "OneContentTableViewCell.h"

@interface OneContentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSString *contentStr;
@end

@implementation OneContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.table];
}



#pragma mark - UITableView Delegate And Datasource
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneContentTableViewCell *contentCell = [tableView dequeueReusableCellWithIdentifier:@"contentCell"];
    contentCell.contentCellBlock = ^(NSString *content) {
       self.contentStr = content;
    };
    return contentCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

#pragma mark - 懒加载
-(UITableView *)table{
    if(!_table){
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT)];
        _table = table;
        _table.backgroundColor = [UIColor whiteColor];
        //_table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.delegate = self;
        _table.dataSource = self;
        [self.view addSubview:_table];
        
        [_table registerClass:[OneContentTableViewCell class] forCellReuseIdentifier:@"contentCell"];
    }
    return _table;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (self.contentBlock) {
        self.contentBlock(@"hehe");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
