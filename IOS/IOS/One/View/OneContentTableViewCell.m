//
//  OneContentTableViewCell.m
//  IOS
//
//  Created by 杨丰林 on 2019/1/9.
//  Copyright © 2019 杨丰林. All rights reserved.
//

#import "OneContentTableViewCell.h"
#import <Masonry/Masonry.h>

@interface OneContentTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UIButton *iconBtn;
@property (nonatomic, strong) UILabel *cellTitle;
@end

@implementation OneContentTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}


-(void)initView{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UIImageView *iconImageView = [[UIImageView alloc]init];
    [iconImageView setBackgroundColor:[UIColor whiteColor]];
    [self.contentView addSubview:iconImageView];
    self.iconImageView = iconImageView;
    [iconImageView setContentMode:UIViewContentModeScaleToFill];
    
    
    UILabel *cellTitle = [[UILabel alloc] init];
    cellTitle.font = [UIFont systemFontOfSize:20];
    cellTitle.text = @"";
    cellTitle.textColor = [UIColor colorWithHexString:@"#F3F4F8"];
    cellTitle.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:cellTitle];
    self.cellTitle = cellTitle;
    
    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = [UIColor colorWithHexString:@"#F3F4F8"];
    [self.contentView addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(12);
        make.bottom.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(1.0);
    }];
    
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(selectSource:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.masksToBounds = YES;
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    button.layer.cornerRadius = 4.0f;
    self.iconBtn = button;
    [button setTitle:@"Check" forState:UIControlStateNormal];
    [self.contentView addSubview:self.iconBtn];
    
    
    [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.height.width.mas_equalTo(40);
    }];
}

-(void)selectSource:(UIButton *)sender{
    if (self.contentCellBlock) {
        self.contentCellBlock(@"");
    }
}

+(CGFloat)CellH{
    return 44.0f;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
