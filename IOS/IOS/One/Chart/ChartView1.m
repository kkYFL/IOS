//
//  ChartView1.m
//  IOS
//
//  Created by 杨丰林 on 2019/10/25.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import "ChartView1.h"
#import "Masonry.h"

@implementation ChartView1


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}



- (void)drawRect:(CGRect)rect {
    CGContextRef context =UIGraphicsGetCurrentContext();
    // 设置线条的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 绘制线的宽度
    CGContextSetLineWidth(context,1.0);
    // 开始绘制
    CGContextBeginPath(context);
    


    // 绘制横向线
    NSMutableArray *levelPointArr = [NSMutableArray array];
    [levelPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(0, rect.size.height/2.0-0.5)]];
    [levelPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width-5, rect.size.height/2.0-0.5)]];
    [levelPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width-10, rect.size.height/2.0-0.5-5)]];
    [levelPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width, rect.size.height/2.0)]];
    [levelPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width-10, rect.size.height/2.0+0.5+5)]];
    [levelPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width-5, rect.size.height/2.0+0.5)]];
    [levelPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(0, rect.size.height/2.0+0.5)]];
    [levelPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(0, rect.size.height/2.0-0.5)]];
    [self drawLevelPathWithContext:context Rect:rect lineColor:[UIColor colorWithHexString:@"#2E86FF"] PointArr:levelPointArr];
    
    
    // 绘制纵向线
    NSMutableArray *hPointArr = [NSMutableArray array];
    [hPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width/2.0, 0)]];
    [hPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width/2.0+0.5+5, 10)]];
    [hPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width/2.0+0.5, 5)]];
    [hPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width/2.0+0.5, rect.size.height)]];
    [hPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width/2.0-0.5, rect.size.height)]];
    [hPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width/2.0-0.5, 5)]];
    [hPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width/2.0-0.5-5,10)]];
    [hPointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width/2.0, 0)]];
    [self drawLevelPathWithContext:context Rect:rect lineColor:[UIColor colorWithHexString:@"#FF8C00"] PointArr:hPointArr];
    
    
    
    NSMutableArray *pointArr = [NSMutableArray array];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(0, 1)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width-1, 1)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(rect.size.width-1, rect.size.height-1)]];
    [pointArr addObject:[NSValue valueWithCGPoint:CGPointMake(1, rect.size.height-1)]];
    
    
    CGPoint startPoint;
    CGPoint endPoint;
    for (NSInteger i = 0; i<4; i++) {
        startPoint = [pointArr[i] CGPointValue];
        endPoint = [pointArr[(i+1)%4] CGPointValue];
        [self drawPathWithContext:context Rect:rect StartPoint:startPoint EndPoint:endPoint];
    }
    
    

    
    
    // 关闭图像
    CGContextClosePath(context);
}


- (void)drawPathWithContext:(CGContextRef)context Rect:(CGRect)rect StartPoint:(CGPoint)start EndPoint:(CGPoint)endPoint{
   // 线的颜色
   CGContextSetStrokeColorWithColor(context, [UIColor colorWithHexString:@"#EAECF0"].CGColor);
    // 设置虚线绘制起点
    CGContextMoveToPoint(context,start.x,start.y);
    // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
    CGFloat lengths[] = {10,10};
    // 虚线的起始点
    CGContextSetLineDash(context,0, lengths,2);
    // 绘制虚线的终点
    CGContextAddLineToPoint(context,endPoint.x,endPoint.y);
    // 绘制
    CGContextStrokePath(context);
}


- (void)drawLevelPathWithContext:(CGContextRef)context Rect:(CGRect)rect lineColor:(UIColor *)lineColor PointArr:(NSArray *)pointArr{
    // 绘制线的宽度
    CGContextSetLineWidth(context,1.0);
    CGContextSetFillColorWithColor(context, lineColor.CGColor);
    for (NSInteger i = 0; i<pointArr.count; i++) {
        CGPoint tmpPoint = [pointArr[i] CGPointValue];
        if (i == 0) {
            CGContextMoveToPoint(context,tmpPoint.x,tmpPoint.y);
        }else{
            CGContextAddLineToPoint(context,tmpPoint.x,tmpPoint.y);
        }
    }
    
//    // 绘制虚线的终点
//    CGContextAddLineToPoint(context,endPoint.x,endPoint.y);
//
//    CGContextAddLineToPoint(context,endPoint.x - 5,endPoint.y + 20);
//    CGContextAddLineToPoint(context,endPoint.x + 10,endPoint.y - 10);
//    CGContextAddLineToPoint(context,endPoint.x -5,endPoint.y -20 - 20);
//
//    // 绘制虚线的终点
//    CGContextAddLineToPoint(context,endPoint.x,endPoint.y - 20);
//
//    CGContextAddLineToPoint(context,start.x,start.y - 20);
    
    
    
    
    CGContextClosePath(context);

    // 绘制
//    CGContextStrokePath(context);
    
    CGContextFillPath(context);
    
}


-(void)initView{
    UILabel *tmplabel1 = [self createLabel];
    tmplabel1.text = @"潜力区域";
    [self addSubview:tmplabel1];
    [tmplabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(4.0f);
        make.top.equalTo(self).offset(4.0f);
    }];
    
    
    UILabel *tmplabel2 = [self createLabel];
    tmplabel2.text = @"学科兴趣";
    tmplabel2.textColor = [UIColor colorWithHexString:@"#FF8C00"];
    [self addSubview:tmplabel2];
    [tmplabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(4.0f);
        make.top.equalTo(self).offset(4.0f);
    }];
    
    
    UILabel *tmplabel3 = [self createLabel];
    tmplabel3.text = @"优势区域";
    [self addSubview:tmplabel3];
    [tmplabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-4.0f);
        make.top.equalTo(self).offset(4.0f);
    }];
    
    
    UILabel *tmplabel4 = [self createLabel];
    tmplabel4.text = @"学科能力";
    tmplabel4.textColor = [UIColor colorWithHexString:@"#2E86FF"];
    [self addSubview:tmplabel4];
    [tmplabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-4.0f);
        make.top.equalTo(self.mas_centerY).offset(4.0f);
    }];
    
    
    
    UILabel *tmplabel5 = [self createLabel];
    tmplabel5.text = @"备选区域";
    [self addSubview:tmplabel5];
    [tmplabel5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-4.0f);
        make.bottom.equalTo(self).offset(-4.0f);
    }];
    
    
    UILabel *tmplabel6 = [self createLabel];
    tmplabel6.text = @"盲区区域";
    [self addSubview:tmplabel6];
    [tmplabel6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(4.0f);
        make.bottom.equalTo(self).offset(-4.0f);
    }];

    
    
    NSArray *kemuArr = [NSArray arrayWithObjects:@"历",@"政",@"生",@"化",@"物",@"技",@"地", nil];
    NSArray *kemuColorArr = [NSArray arrayWithObjects:@"#BA55D3",@"#2E86FF",@"#87CEFA",@"#DA70D6",@"#FF8C00",@"#32CD32",@"#FF69B4", nil];
    NSMutableArray *dataArr = [NSMutableArray array];
    [dataArr addObject:[NSValue valueWithCGPoint:CGPointMake(0.8, 3)]];
    [dataArr addObject:[NSValue valueWithCGPoint:CGPointMake(2.4, 2.4)]];
    [dataArr addObject:[NSValue valueWithCGPoint:CGPointMake(2.8, 3.1)]];
    [dataArr addObject:[NSValue valueWithCGPoint:CGPointMake(2.8, 2.6)]];
    [dataArr addObject:[NSValue valueWithCGPoint:CGPointMake(3.5, 3.2)]];
    [dataArr addObject:[NSValue valueWithCGPoint:CGPointMake(3.5, 3)]];
    [dataArr addObject:[NSValue valueWithCGPoint:CGPointMake(3.5, 2.4)]];
    
    
    CGFloat viewW = self.frame.size.width;
    CGFloat viewH = self.frame.size.height;
    
    for (NSInteger i=0; i<kemuArr.count; i++) {
        UIButton *tmpBtn = [self createBtn];
        [self addSubview:tmpBtn];
        NSString *title = kemuArr[i];
        [tmpBtn setTitle:title forState:UIControlStateNormal];
        [tmpBtn setBackgroundColor:[UIColor colorWithHexString:kemuColorArr[i]]];
        
        CGPoint tmpPoint = [dataArr[i] CGPointValue];
        CGFloat tmpCenterX = (tmpPoint.x-2)/2.0*viewW/2.0;
        CGFloat tmpCenterY = (-(tmpPoint.y-2)/2.0)*viewH/2.0;

        
        [tmpBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX).offset(tmpCenterX);
            make.centerY.equalTo(self.mas_centerY).offset(tmpCenterY);
            make.height.width.mas_equalTo(20.0f);
        }];
    }
    
    
    
    
    
}

-(UILabel *)createLabel{
    UILabel *tmpLabel = [[UILabel alloc] init];
    tmpLabel.font = [UIFont systemFontOfSize:12.0f];
    tmpLabel.textColor = [UIColor colorWithHexString:@"#C8CBD4"];
    tmpLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:tmpLabel];
    return tmpLabel;
}


-(UIButton *)createBtn{
    UIButton *button = [[UIButton alloc]init];
    [button addTarget:self action:@selector(selectSource:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YES;
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:8.0f]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.cornerRadius = 10.0f;
    return button;
}

-(void)selectSource:(UIButton *)sendder{
    NSLog(@"JJ");
}


@end
