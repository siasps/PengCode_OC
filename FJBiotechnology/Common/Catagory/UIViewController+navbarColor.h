//
//  UIViewController+navbarColor.h
//  BiyingEducation
//
//  Created by Huamo on 2018/11/19.
//  Copyright © 2018年 peng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (navbarColor)

@property (nonatomic, assign) CGFloat navbarAlpha;


- (void)setNavBarClearColor;

- (void)setNavBarWithColor:(UIColor *)color;

- (void)setNavBarWithShadowColor:(UIColor *)color;

- (void)setNavBarWithAlpha:(CGFloat)alpha;

- (UIImage *)imageWithColor:(UIColor *)color;


@end

NS_ASSUME_NONNULL_END
