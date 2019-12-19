
//
//  UIViewController+navbarColor.m
//  BiyingEducation
//
//  Created by Huamo on 2018/11/19.
//  Copyright © 2018年 peng. All rights reserved.
//

#import "UIViewController+navbarColor.h"
#import "KMNavigationBarTransition.h"


@implementation UIViewController (navbarColor)

- (void)setNavBarClearColor{
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
}

- (void)setNavBarWithColor:(UIColor *)color{
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:color] forBarMetrics:UIBarMetricsDefault];
    
  

    
}

- (void)setNavBarWithShadowColor:(UIColor *)color{
    
    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.navigationBar setShadowImage:[self imageWithColor:color size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 0.5)]];
}

- (void)setNavBarWithAlpha:(CGFloat)alpha{
    
    self.navigationController.navigationBar.translucent = alpha<1.0;
    [self.navigationController.navigationBar setBackgroundImage:[self imageWithColor:[Nav_Color colorWithAlphaComponent:alpha]] forBarMetrics:UIBarMetricsDefault];
    
    self.navbarAlpha = alpha;
}

- (UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

#pragma mark - public methods
- (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    if (!color || size.width <= 0 || size.height <= 0) return nil;
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}



- (CGFloat)navbarAlpha{
    NSNumber *number = objc_getAssociatedObject(self, @"navbarAlpha") ? : @1.0;
    return [number floatValue];
}

- (void)setNavbarAlpha:(CGFloat)navbarAlpha {
    
    objc_setAssociatedObject(self, @"navbarAlpha", @(navbarAlpha), OBJC_ASSOCIATION_ASSIGN);
}


@end
