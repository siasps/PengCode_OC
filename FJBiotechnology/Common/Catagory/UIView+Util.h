//
//  UIView+Util.h
//  yitongxing
//
//  Created by 曹宇 on 2017/5/19.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Util)
//分类只能扩展方法，不能生成_x等
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGSize  size;
@property (nonatomic, assign) CGPoint origin;

-(void) setNeedsDisplayAndLayout;
-(CGPoint) toucheLocation:(UITouch*)touch;
-(CGPoint) toucheLocationInSuper:(UITouch*)touch;
-(CGRect) frameInSuperView:(UIView*)superView;
-(CGRect) frameInWindow;
-(void) setForCustomConstraints;
-(void) addToSuperview:(UIView *)superview;
-(CGPoint)toucheLocationInWindow:(UITouch*)touch;
@property (nullable, nonatomic, readonly, strong) UIViewController *viewController;

//位于view下面，间距为padding
- (void)underView:(UIView *)view padding:(CGFloat)padding;
//垂直居中对齐 view：相对view padding：间距
- (void)verticalAllignment:(UIView *)view;
@end

