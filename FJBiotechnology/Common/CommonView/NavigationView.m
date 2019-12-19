//
//  NavigationView.m
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import "NavigationView.h"

static CGFloat navigationLineHeight = 0.5;
@interface NavigationView ()
@property (nonatomic, strong)UIView *viewOfNavigationLine;
@end

@implementation NavigationView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config{
    self.backgroundColor = [UIColor blueColor];
    //Navi_GrayColor;

    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0,StatusHeight, SCREEN_WIDTH-120, NaviBarHeight)];
    //    self.label.backgroundColor = [UIColor redColor];
    self.titleLabel.centerX = SCREEN_WIDTH/2.0;
    self.titleLabel.font = [UIFont fontWithName:FatFont size:17];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.textColor = [UIColor blackColor];
    [self addSubview:self.titleLabel];
    
    //返回
    self.tapToReturn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tapToReturn2.backgroundColor = self.backgroundColor;
    self.tapToReturn2.frame = CGRectMake(0, 0, 55, NaviViewHeight);
    [self addSubview:self.tapToReturn2];
    
    self.imageViewOfReturn = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backButton"]];
    self.imageViewOfReturn.frame = CGRectMake(15,NaviViewHeight-18, 18, 18);
    self.imageViewOfReturn.centerY = self.titleLabel.centerY;
    self.imageViewOfReturn.userInteractionEnabled = YES;
    [self addSubview:self.imageViewOfReturn];
    self.tapToReturn = [[UITapGestureRecognizer alloc]init];
    [self.imageViewOfReturn addGestureRecognizer:self.tapToReturn];
    
    
    
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame = CGRectMake(SCREEN_WIDTH-80-15, NaviViewHeight-64 + 30, 80, 20);
    _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [_rightButton setTitleColor:Default_Color forState:UIControlStateNormal];
    _rightButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_rightButton];
    
    
    
    self.viewOfNavigationLine = [[UIView alloc]init];
    self.viewOfNavigationLine.backgroundColor = [UIColor colorWithInt:0xffcecece];
    [self addSubview:self.viewOfNavigationLine];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (!_isHideLine) {
        self.viewOfNavigationLine.frame = CGRectMake(0, NaviViewHeight-navigationLineHeight, SCREEN_WIDTH, navigationLineHeight);
    }
    
}

- (void)setIsHideReturnButton:(BOOL)isHideReturnButton{
    _isHideReturnButton = isHideReturnButton;
    self.imageViewOfReturn.hidden = isHideReturnButton;
}

@end
