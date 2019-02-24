//
//  OneHomeViewController.m
//  IOS
//
//  Created by 杨丰林 on 2019/1/3.
//  Copyright © 2019年 杨丰林. All rights reserved.
//

#import "OneHomeViewController.h"
#import "OneContentViewController.h"
#import "YFLTmpTool.h"
#import "YFLPerson.h"

@interface OneHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, strong) NSString *content;
@property (nonatomic, strong) YFLTmpTool *yflTool;

@property (nonatomic, strong) UIImageView *tmpView;
@end

@implementation OneHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"ONE";
    
    [self initView];
    
    [self loadData];
    
    
    self.tmpView = [[UIImageView alloc]init];
    [self.tmpView setImage:[UIImage imageNamed:@"user_icon"]];
    
    YFLPerson *person = [[YFLPerson alloc]init];
    person.name = @"YFL";
    [person performSelector:@selector(eat)];
    
}

-(void)initView{
    [self.view addSubview:self.table];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"click" style:UIBarButtonItemStylePlain target:self action:@selector(rightClick:)];
    
    
    self.yflTool = [[YFLTmpTool alloc]init];
}

-(void)loadData{
    [self.table reloadData];
}

#pragma mark - UITableView Delegate And Datasource
//UITableViewDelegate,UITableViewDataSource
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
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OneContentViewController *contentVC = [[OneContentViewController alloc] init];
    contentVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:contentVC animated:YES];
}

#pragma mark - 懒加载
-(UITableView *)table{
    if(!_table){
        UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-NAVIGATION_BAR_HEIGHT)];
        _table = table;
        _table.backgroundColor = RGB(242, 242, 242, 1.0);
        //_table.separatorStyle = UITableViewCellSeparatorStyleNone;
        _table.delegate = self;
        _table.dataSource = self;
        [self.view addSubview:_table];
        
        //[_table registerClass:[CareerProfessionjingduCell class] forCellReuseIdentifier:@"CareerjindguCell"];
    }
    return _table;
}


#pragma mark - methord
-(void)rightClick:(UIButton *)sender{

//    int val = 10; void (^blk)(void) = ^{ printf("val=%d\n",val);
//    };
//    val = 2;
//    blk();
    
//    int val = 10;
//    void (^blk) (void) = ^{
//        NSLog(@"%d",val);
//    };
//
//    val = 2;
//
//    blk();
    
   __block int val = 10;
    void (^blk) (void) = ^{
        NSLog(@"%d",val);
    };
    
    val = 2;
    
    blk();
    
    
    typedef void (^handleBlock)(void);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
