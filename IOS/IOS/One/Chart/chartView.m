//
//  chartView.m
//  IOS
//
//  Created by 杨丰林 on 2019/10/24.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import "chartView.h"

@implementation chartView

- (void)drawRect:(CGRect)rect {
    CGContextRef context =UIGraphicsGetCurrentContext();
    // 设置线条的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 绘制线的宽度
    CGContextSetLineWidth(context,1.0);
    // 线的颜色
    CGContextSetStrokeColorWithColor(context, [UIColor colorWithHexString:@"#EAECF0"].CGColor);
    // 开始绘制
    CGContextBeginPath(context);
    
    CGFloat pointY = 0.0f;
    CGPoint startPoint = CGPointMake(0.0, 0.0);
    CGPoint endPoint = CGPointMake(rect.size.width, 0.0);
    for (NSInteger i = 0; i<6; i++) {
        pointY = 30*i+i;
        startPoint.y = pointY;
        endPoint.y = pointY;
        [self drawPathWithContext:context Rect:rect StartPoint:startPoint EndPoint:endPoint];
    }
    // 关闭图像
    CGContextClosePath(context);

}

- (void)drawPathWithContext:(CGContextRef)context Rect:(CGRect)rect StartPoint:(CGPoint)start EndPoint:(CGPoint)endPoint{
    // 设置虚线绘制起点
    CGContextMoveToPoint(context,0.0,start.y);
    // lengths的值｛10,10｝表示先绘制10个点，再跳过10个点，如此反复
    CGFloat lengths[] = {10,10};
    // 虚线的起始点
    CGContextSetLineDash(context,0, lengths,2);
    // 绘制虚线的终点
    CGFloat lineW = rect.size.width;
    CGContextAddLineToPoint(context,lineW,endPoint.y);
    // 绘制
    CGContextStrokePath(context);
}


@end
