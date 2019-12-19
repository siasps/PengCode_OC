//
//  BaseViewController.h
//  Astrologie
//
//  Created by 曹宇 on 2018/3/26.
//  Copyright © 2018年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationView.h"
@interface BaseViewController : UIViewController
@property (nonatomic, strong)NavigationView *navigationView;
@property (nonatomic, copy)NSString * navigationViewTitle;
@property (nonatomic, copy)NSString *naviTitle;
@property (nonatomic, copy)NSString * bottomButtonTitle;
- (void)handleBottomButtonClick;
- (void)showCustomBackButton;
- (void)showCustomWhiteBackButton;
- (void)handleLeftBackButtonReturn;
- (void)handleRightButtonClick;
- (void)close;

- (void)showHalfAlphaBlackView;
- (void)hideHalfAlphaBlackView;

- (void)setTitleView;

- (void)setNaviTitle:(NSString *)naviTitle textColor:(UIColor *)textColor;


@end




@interface UIViewController (HM)

- (void)showEmptyView;
- (void)showEmptyViewWithMessage:(NSString *)message;
- (void)showEmptyViewWithMessage:(NSString *)message inView:(UIView *)inView;
- (void)hideEmptyViewInView:(UIView *)view;
- (void)hideEmptyView;


/**
 子类重写，无网络的处理
 重写这个方法：无网络时，弹出无网络页面，点击刷新数据
 不重写：不会弹出无网络页面
 */
- (BOOL)canShowNotNetView;
- (void)refrushWithNotNet;



@end
