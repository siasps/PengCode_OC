//
//  NavigationView.h
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import "BaseView.h"

@interface NavigationView : BaseView
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, assign)BOOL isHideLine;
@property (nonatomic, strong)UIImageView *imageViewOfReturn;
@property (nonatomic, strong)UITapGestureRecognizer *tapToReturn;
@property (nonatomic, strong)UIButton *tapToReturn2;
@property (nonatomic, strong)UIButton *rightButton;
@property (nonatomic, assign)BOOL isHideReturnButton;
@end
