//
//  ChartLayoutView.m
//  IOS
//
//  Created by 杨丰林 on 2019/10/24.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import "ChartLayoutView.h"
#import "chartView.h"
#import "Masonry.h"

@interface ChartLayoutView ()
@property (nonatomic, strong) NSMutableArray *labelArr;
@property (nonatomic, strong) NSMutableArray *dataArr;
@end

@implementation ChartLayoutView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0f;
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor colorWithHexString:@"#EAECF0"].CGColor;
        
        
        chartView *chView = [[chartView alloc] initWithFrame:CGRectMake(75.0f, 20, frame.size.width-75-16, 211.0f)];
        chView.backgroundColor =[UIColor whiteColor];
        [self addSubview:chView];
        
        
        self.dataArr = [NSMutableArray arrayWithObjects:@"很感兴趣",@"较感兴趣",@"一般",@"不太感兴趣",@"很不感兴趣", nil];
        CGFloat originY = 20.0f;
        for (NSInteger i = 0; i<self.dataArr.count; i++) {
            originY = 30*i+20.0f;
            
            UILabel *tmpLab = [[UILabel alloc] init];
            tmpLab.font = [UIFont systemFontOfSize:11.0];
            tmpLab.text = self.dataArr[i];
            tmpLab.textColor = [UIColor colorWithHexString:@"#6B7884"];
            tmpLab.textAlignment = NSTextAlignmentCenter;
            [self addSubview:tmpLab];
            
            [tmpLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(0.0f);
                make.top.equalTo(self).offset(originY);
                make.width.mas_equalTo(75.0f);
                make.height.mas_equalTo(20.0f);
            }];
        }
        
    }
    return self;
}



@end
