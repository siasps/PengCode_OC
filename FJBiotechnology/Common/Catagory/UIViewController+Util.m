//
//  UIViewController+Util.m
//  译同行
//
//  Created by 曹宇 on 2017/5/19.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "UIViewController+Util.h"
@implementation UIViewController (Util)

#pragma mark - 方法
- (void)presentViewController:(UIViewController *)controller animated: (BOOL)animated {
    [self presentViewController:controller animated:animated completion:nil];
}

- (void)pushViewController:(UIViewController *)controller animated:(BOOL)animated {
    [self.navigationController pushViewController:controller animated:animated];
}

- (void)replacePushWithController:(UIViewController *)controller animated:(BOOL)animated {
    NSMutableArray* navArray = [[NSMutableArray alloc] initWithArray:self.navigationController.viewControllers]; [navArray replaceObjectAtIndex:[navArray count]-1 withObject:controller];
    [self.navigationController setViewControllers:navArray animated:animated];
}

- (void)popViewControllerAnimated:(BOOL)animated{

    [self.navigationController popViewControllerAnimated:animated];
   
}
- (void)dismissViewControllerAnimated:(BOOL)animated{

    [self dismissViewControllerAnimated:animated completion:nil];
}

- (void)popToRootViewControllerAnimated:(BOOL)animated {
    [self.navigationController popToRootViewControllerAnimated:animated];
}

- (void)popToViewControllerAtIndex:(NSUInteger)index animated:(BOOL)animated {
     NSArray* viewControllers = self.navigationController.viewControllers;
    
    if (index >= viewControllers.count) {
        NSLog(@"超过Controller数组个数了");
    }else{
    [self.navigationController popToViewController:viewControllers[index] animated:animated];
    }
}

#pragma mark - 清理app缓存
- (void)handleClearCache{
    //删除两部分
    //1.删除 sd 图片缓存
    //先清除内存中的图片缓存
    [[SDImageCache sharedImageCache] clearMemory];
    //清除磁盘的缓存
    [[SDImageCache sharedImageCache] clearDiskOnCompletion:^{

    }];
    //2.删除自己缓存
    NSString *myCachePath = [NSHomeDirectory() stringByAppendingPathComponent:@"Library/Caches"];
    [[NSFileManager defaultManager] removeItemAtPath:myCachePath error:nil];
    //3.JSON缓存
    //[HHttpManager removeAllHttpCache];
}

- (void)setNavRightItem:(SEL)selector image:(UIImage *)image imageH:(UIImage *)imageH {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:imageH forState:UIControlStateHighlighted];
    [backButton setFrame:CGRectMake(0, 7, 24, 24)];
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.rightBarButtonItem = backItem;
}
-(void)setNavRightItem:(SEL)selector title:(NSString *)title color:(UIColor *)color
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitle:title forState:UIControlStateHighlighted];
    [backButton setTitleColor:color forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0, 7, 70, 30)];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.rightBarButtonItem = backItem;
}

- (void)setNavRightItemsWithSelector1:(SEL)selector1 image1:(UIImage *)image1 imageH1:(UIImage *)imageH1
Selector2:(SEL)selector2 image2:(UIImage *)image2 imageH2:(UIImage *)imageH2{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:image1 forState:UIControlStateNormal];
    [backButton setImage:imageH1 forState:UIControlStateHighlighted];
    [backButton setFrame:CGRectMake(0, 7, 24, 24)];
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [backButton addTarget:self action:selector1 forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    
    
    
    
    
    UIButton *backButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton2 setImage:image2 forState:UIControlStateNormal];
    [backButton2 setImage:imageH2 forState:UIControlStateHighlighted];
    [backButton2 setFrame:CGRectMake(0, 7, 24, 24)];
    backButton2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [backButton2 addTarget:self action:selector2 forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem2 = [[UIBarButtonItem alloc] initWithCustomView:backButton2];
    
    self.navigationItem.rightBarButtonItems = @[backItem,backItem2];
}

// 判断用户是否允许接收通知
- (BOOL)isUserNotificationEnable {
    BOOL isEnable = NO;
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0f) { // iOS版本 >=8.0 处理逻辑
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        isEnable = (UIUserNotificationTypeNone == setting.types) ? NO : YES;
    } else { // iOS版本 <8.0 处理逻辑
        UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        isEnable = (UIRemoteNotificationTypeNone == type) ? NO : YES;
    }
    return isEnable;
}

//设置 - 通知
- (void)goToAppSystemSetting {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([application canOpenURL:url]) {
        if ([application respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [application openURL:url options:@{} completionHandler:nil];
        } else {
            [application openURL:url];
        }
    }
}
@end
