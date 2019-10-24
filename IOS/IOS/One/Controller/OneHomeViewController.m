//
//  OneHomeViewController.m
//  IOS
//
//  Created by 杨丰林 on 2019/1/3.
//  Copyright © 2019年 杨丰林. All rights reserved.
//

#import "OneHomeViewController.h"
#import "OneContentViewController.h"
#import "ChartViewController.h"
#import "YFLTmpTool.h"
#import "YFLPerson.h"
#import "ReactiveCocoa.h"


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
//
//
//    self.tmpView = [[UIImageView alloc]init];
//    [self.tmpView setImage:[UIImage imageNamed:@"user_icon"]];
//
//    YFLPerson *person = [[YFLPerson alloc]init];
//    person.name = @"YFL";
//    [person performSelector:@selector(eat)];
    
    
    
    
//    RACSignal *sigal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//        [subscriber sendNext:@"123456"];
//        return [RACDisposable disposableWithBlock:^{
//        }];
//    }];
//    //处理数据显示UI
//    RACDisposable *disposable = [sigal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
//    [disposable dispose];
    
    
    
    
//    RACSubject *subject = [RACSubject subject];
//    [subject subscribeNext:^(id x) {
//        NSLog(@"%@");
//    }];
//    [subject sendNext:@"ysksksk"];
    
    
    
    
//    RACReplaySubject *replaySubject = [RACReplaySubject subject];
//    [replaySubject sendNext:@"Y"];
//    [replaySubject sendNext:@"F"];
//    [replaySubject subscribeNext:^(id x) {
//        NSLog(@"第一个订阅者%@",x);
//    }];
//    [replaySubject subscribeNext:^(id x) {
//        NSLog(@"第二个订阅者%@",x);
//    }];
    
    
//    [self test1];
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
    if (indexPath.row == 0) {
        cell.textLabel.text = @"Chart";
        
//        cell.textLabel.font = [UIFont fontWithName:@"Ayuthaya" size:20];
//        cell.textLabel.font = [UIFont fontWithName:@"Helvetica-BoldOblique" size:20];
        cell.textLabel.font = [UIFont fontWithName:@"Verdana" size:20];

    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        ChartViewController *charVC = [[ChartViewController alloc] init];
        charVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:charVC animated:YES];
    }else{
        OneContentViewController *contentVC = [[OneContentViewController alloc] init];
        contentVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:contentVC animated:YES];
    }
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


// 普通做法
- (void)test1 {
    // RACCommand: 处理事件
    // 不能返回空的信号
    // 1.创建命令
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        //block调用，执行命令的时候就会调用
        NSLog(@"%@",input); // input 为执行命令传进来的参数
        // 这里的返回值不允许为nil
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
//            [subscriber sendNext:@"执行命令产生的数据"];
            return nil;
        }];
    }];
    
    // 如何拿到执行命令中产生的数据呢？
    // 订阅命令内部的信号
    // ** 方式一：直接订阅执行命令返回的信号
    
    // 2.执行命令
    RACSignal *signal =[command execute:@2]; // 这里其实用到的是replaySubject 可以先发送命令再订阅
    // 在这里就可以订阅信号了
//    [signal subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//    }];
    
}
// 一般做法
- (void)test2 {
    // 1.创建命令
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        //block调用，执行命令的时候就会调用
        NSLog(@"%@",input); // input 为执行命令传进来的参数
        // 这里的返回值不允许为nil
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"执行命令产生的数据"];
            return nil;
        }];
    }];
    
    // 方式二：
    // 订阅信号
    // 注意：这里必须是先订阅才能发送命令
    // executionSignals：信号源，信号中信号，signalofsignals:信号，发送数据就是信号
    [command.executionSignals subscribeNext:^(RACSignal *x) {
        [x subscribeNext:^(id x) {
            NSLog(@"%@", x);
        }];
        //        NSLog(@"%@", x);
    }];
    
    // 2.执行命令
    [command execute:@2];
}
// 高级做法
- (void)test3 {
    
    // 1.创建命令
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        // block调用：执行命令的时候就会调用
        NSLog(@"%@", input);
        // 这里的返回值不允许为nil
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"发送信号"];
            return nil;
        }];
    }];
    
    // 方式三
    // switchToLatest获取最新发送的信号，只能用于信号中信号。
    [command.executionSignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    // 2.执行命令
    [command execute:@3];
    
}

// switchToLatest
- (void)test4 {
    // 创建信号中信号
    RACSubject *signalofsignals = [RACSubject subject];
    RACSubject *signalA = [RACSubject subject];
    // 订阅信号
    //    [signalofsignals subscribeNext:^(RACSignal *x) {
    //        [x subscribeNext:^(id x) {
    //            NSLog(@"%@", x);
    //        }];
    //    }];
    // switchToLatest: 获取信号中信号发送的最新信号
    [signalofsignals.switchToLatest subscribeNext:^(id x) {
        NSLog(@"%@", x);
    }];
    // 发送信号
    [signalofsignals sendNext:signalA];
    [signalA sendNext:@4];
}

// 监听事件有没有完成
- (void)test5 {
    //注意：当前命令内部发送数据完成，一定要主动发送完成
    // 1.创建命令
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
        // block调用：执行命令的时候就会调用
        NSLog(@"%@", input);
        // 这里的返回值不允许为nil
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            // 发送数据
            [subscriber sendNext:@"执行命令产生的数据"];
            
            // *** 发送完成 **
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    // 监听事件有没有完成
    [command.executing subscribeNext:^(id x) {
        if ([x boolValue] == YES) { // 正在执行
            NSLog(@"当前正在执行%@", x);
        }else {
            // 执行完成/没有执行
            NSLog(@"执行完成/没有执行");
        }
    }];
    
    // 2.执行命令
    [command execute:@1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
