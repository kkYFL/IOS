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
@property (nonatomic, strong) NSMutableArray *titleArr;
@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) NSMutableArray *kemuArr;
@end

@implementation ChartLayoutView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0f;
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor colorWithHexString:@"#EAECF0"].CGColor;
        
        
        chartView *chView = [[chartView alloc] initWithFrame:CGRectMake(75.0f, 20, frame.size.width-75-16, 156.0f)];
        chView.backgroundColor =[UIColor whiteColor];
        [self addSubview:chView];
        
        
        self.titleArr = [NSMutableArray arrayWithObjects:@"很感兴趣",@"较感兴趣",@"一般",@"不太感兴趣",@"很不感兴趣", nil];
        CGFloat originY = 20.0f;
        for (NSInteger i = 0; i<self.titleArr.count; i++) {
            originY = 30*i+20.0f;
            
            UILabel *tmpLab = [[UILabel alloc] init];
            tmpLab.font = [UIFont systemFontOfSize:11.0];
            tmpLab.text = self.titleArr[i];
            tmpLab.textColor = [UIColor colorWithHexString:@"#6B7884"];
            tmpLab.textAlignment = NSTextAlignmentCenter;
            [self addSubview:tmpLab];
            
            [tmpLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(0.0f);
                make.top.equalTo(self).offset(originY);
                make.width.mas_equalTo(75.0f);
                make.height.mas_equalTo(30.0f);
            }];
        }
        
        
        
        self.kemuArr = [NSMutableArray arrayWithObjects:@"化学",@"生物",@"政治",@"地理", nil];
        self.dataArr = [NSMutableArray arrayWithObjects:@(136),@(148),@(145),@(130), nil];
        
        CGFloat charW = chView.frame.size.width;
        CGFloat viewW = 12.0f;
        CGFloat bottomW = (charW-15.0*2-self.dataArr.count*viewW)/(self.dataArr.count-1);
        CGFloat viewOriginX = 75.0f+15.0f;
        
        for (NSInteger i= 0; i<self.dataArr.count; i++) {
            viewOriginX = 75.0+15.0+(viewW+bottomW)*i;
            UIView *tmpView = [self createView];
            CGFloat tmpViewH = [self.dataArr[i] floatValue];
            [tmpView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(viewOriginX);
                make.bottom.equalTo(self).offset(-35.0f);
                make.width.mas_equalTo(viewW);
                make.height.mas_equalTo(tmpViewH);
            }];
            
            UILabel *tmpLabel = [self createLabel];
            tmpLabel.text = self.kemuArr[i];
            [tmpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(tmpView.mas_bottom).offset(8.0f);
                make.centerX.equalTo(tmpView);
            }];
        }
        
        
    }
    return self;
}


-(UIView *)createView{
    UIView *tmpView = [[UIView alloc]init];
    tmpView.backgroundColor = [UIColor colorWithHexString:@"#2E86FF"];
    [self addSubview:tmpView];
    return tmpView;
}

-(UILabel *)createLabel{
    UILabel *tmpLabel = [[UILabel alloc] init];
    tmpLabel.font = [UIFont systemFontOfSize:11.0f];
    tmpLabel.textColor = [UIColor colorWithHexString:@"#6B7884"];
    tmpLabel.textAlignment = NSTextAlignmentLeft;
    [self addSubview:tmpLabel];
    return tmpLabel;
}


@end
