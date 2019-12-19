//
//  UIViewController+Util.h
//  译同行
//
//  Created by 曹宇 on 2017/5/19.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UIViewController (Util)


#pragma mark - 方法
- (void)presentViewController:(UIViewController *)controller animated: (BOOL)animated;
- (void)pushViewController:(UIViewController *)controller animated: (BOOL)animated;
- (void)replacePushWithController:(UIViewController *)controller animated:(BOOL)animated;
- (void)popViewControllerAnimated:(BOOL)animated;
- (void)dismissViewControllerAnimated:(BOOL)animated;
- (void)popToRootViewControllerAnimated:(BOOL)animated;
- (void)popToViewControllerAtIndex:(NSUInteger)index animated:(BOOL)animated;

- (void)handleClearCache;

- (void)setNavRightItem:(SEL)selector image:(UIImage *)image imageH:(UIImage *)imageH ;
-(void)setNavRightItem:(SEL)selector title:(NSString *)title color:(UIColor *)color;
- (void)setNavRightItemsWithSelector1:(SEL)selector1 image1:(UIImage *)image1 imageH1:(UIImage *)imageH1
                            Selector2:(SEL)selector2 image2:(UIImage *)image2 imageH2:(UIImage *)imageH2;
 // 判断用户是否允许接收通知
- (BOOL)isUserNotificationEnable;
//设置 - 通知
- (void)goToAppSystemSetting;
@end
