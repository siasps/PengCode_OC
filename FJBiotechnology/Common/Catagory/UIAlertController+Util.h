//
//  UIAlertController+Util.h
//  译同行
//
//  Created by 曹宇 on 2017/5/25.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum{
    
    Action_Ok = 1,          //确定按钮
    Action_Custom = 2,      //自定义按钮
    Action_Cancle = 4       //取消按钮
    
} Action_Name;

@interface UIAlertController (Util)
/** 核心API
 *
 *  1.提供了三种按钮格式(确认,自定义,取消) , 并且可以任意组合使用
 *  2.可以设置确认按钮 及自定义按钮的点击事件.
 *  3.可以设置自定义按钮的名字. (确认按钮 与取消按钮 含有默认名字 ,可以修改)
 *
 *
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                        ActionButton:(Action_Name)action_button
                   CustomButtonTitle:(NSString *)customTitle
                           handlerOK:(void (^)(UIAlertAction *action))handlerOk
                       handlerCustom:(void (^)(UIAlertAction *action))handlerCustom;



/**
 * 此方法 默认带有一个确认按钮 , 点击确认按钮弹框消失
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller;


/**
 * 此方法 默认带有一个确认按钮 , 可设置 确认按钮的点击事件.
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                            OKAction:(void (^)(UIAlertAction *action))action;

/**
 *  此方法 默认带有 确认按钮与 取消按钮 , 可以设置确定按钮的点击事件.
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                              Action:(void (^)(UIAlertAction *action))action;


/**
 *  此方法 默认带有 自定义按钮与 取消按钮 , 可以设置自定义按钮的点击事件.
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                    CustomButonTitle:(NSString *)customTitle
                              Action:(void (^)(UIAlertAction *action))action;



/**
 *  此方法 默认带有 确认按钮与取消按钮 , 可设置确认按钮与 取消按钮的点击事件.
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                              Action:(void (^)(UIAlertAction *action))action
                           EndAction:(void (^)(UIAlertAction *action))end_action;




@end
