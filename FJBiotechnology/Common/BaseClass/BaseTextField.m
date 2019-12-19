//
//  BaseTextField.m
//  译同行
//
//  Created by 曹宇 on 2017/5/24.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "BaseTextField.h"

@implementation BaseTextField

- (void)setLeftPadding:(CGFloat)padding{
     self.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, padding, 0)];
     self.leftViewMode = UITextFieldViewModeAlways;
}


- (void)setRightPadding:(CGFloat)padding{
    self.rightView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.size.width-padding, 0, padding, 0)];
    self.rightViewMode = UITextFieldViewModeAlways;
}

- (void)setLeftRightPadding:(CGFloat)padding{
    [self setLeftPadding:padding];
    [self setRightPadding:padding];
}

@end
