//
//  AppDelegate.m
//  FJBiotechnology
//
//  Created by peng on 2019/2/25.
//  Copyright © 2019 peng. All rights reserved.
//

#import "AppDelegate.h"
#import "CYTabBarController.h"
#import "CYTabBarConfig.h"

#import "FJChooseMethodViewController.h"
#import "FJHomeViewController.h"
#import "FJHealthViewController.h"
#import "FJDetectionViewController.h"
#import "FJMineViewController.h"


@interface AppDelegate ()

@property (nonatomic ,strong) CYTabBarController *tabbar;
@property (nonatomic ,strong) FJChooseMethodViewController *chooseMethod ;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];

    
    // 继承CYTabBar的控制器， 你可以自定定义 或 不继承直接使用
    CYTabBarController * tabbar = [[CYTabBarController alloc]init];
    
    // 配置
    [CYTabBarConfig shared].selectedTextColor = ThemeColor;
    [CYTabBarConfig shared].textColor = [UIColor grayColor];
    [CYTabBarConfig shared].backgroundColor = [UIColor whiteColor];
    [CYTabBarConfig shared].selectIndex = 0;
    [CYTabBarConfig shared].centerBtnIndex = 1;
    [CYTabBarConfig shared].HidesBottomBarWhenPushedOption = HidesBottomBarWhenPushedAlone;
    
   
    FJHomeViewController *home = [[FJHomeViewController alloc] init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:home];
    [tabbar addChildController:homeNav title:@"首页" imageName:@"bar_home_nor" selectedImageName:@"bar_home_press"];
    
    
    FJHealthViewController *health = [[FJHealthViewController alloc] init];
    UINavigationController *healthNav = [[UINavigationController alloc]initWithRootViewController:health];
    [tabbar addChildController:healthNav title:@"健康" imageName:@"bar_health_nor" selectedImageName:@"bar_health_press"];
    
    FJDetectionViewController *detection = [[FJDetectionViewController alloc] init];
    UINavigationController *detectionNav = [[UINavigationController alloc] initWithRootViewController:detection];
    [tabbar addChildController:detectionNav title:@"检测" imageName:@"bar_detection_nor" selectedImageName:@"bar_detection_press"];
    
    FJMineViewController *minection = [[FJMineViewController alloc] init];
    UINavigationController *minectionNav = [[UINavigationController alloc] initWithRootViewController:minection];
    [tabbar addChildController:minectionNav title:@"我的" imageName:@"bar_mine_nor" selectedImageName:@"bar_mine_press"];
    
    
    FJChooseMethodViewController *chooseMethod = [[FJChooseMethodViewController alloc] init];
    _tabbar = tabbar;
    _chooseMethod = chooseMethod;

    [self setRootControllerWithLoginStatus];
    
    
    
    GVUserDefaults *userDefaults = [GVUserDefaults standardUserDefaults];//临时设置参数
    userDefaults.apikey       = @"1.5";
    userDefaults.apisecret    = @"checked";
    
    [self.window makeKeyAndVisible];
    return YES;
}

//检查登录状态
- (void)setRootControllerWithLoginStatus{
    
    if ([UserManager isLogin]) {
        self.window.rootViewController = _tabbar;
    }else{
        self.window.rootViewController = _chooseMethod;
    }
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
