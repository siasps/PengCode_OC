//
//  UIAlertController+Util.m
//  译同行
//
//  Created by 曹宇 on 2017/5/25.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "UIAlertController+Util.h"

static NSString *Action_NameOfOK = @"确认";
static NSString *Action_NameOfCancle = @"取消";
@implementation UIAlertController (Util)

/** 核心API
 *
 *  1.提供了三种按钮格式(确认,自定义,取消) , 并且可以任意组合使用
 *  2.可以设置确认按钮 及自定义按钮的点击事件.
 *  3.可以设置自定义按钮的名字. (确认按钮 与取消按钮 含有默认名字 ,可以修改)
 *
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                        ActionButton:(Action_Name)action_button
                   CustomButtonTitle:(NSString *)customTitle
                           handlerOK:(void (^)(UIAlertAction *))handlerOk
                       handlerCustom:(void (^)(UIAlertAction *))handlerCustom{
    
    
    UIAlertController *alert =  [UIAlertController alertControllerWithTitle:title message:message  preferredStyle:UIAlertControllerStyleAlert];
    
    if (title) {
        NSMutableAttributedString *titleAttribute = [[NSMutableAttributedString alloc]initWithString:title];
        
        [titleAttribute addAttribute:NSForegroundColorAttributeName value:RGBA(39, 39, 39, 1) range:NSMakeRange(0, title.length)];
        
        [titleAttribute addAttribute:NSFontAttributeName value:[UIFont fontWithName:FatFont size:18] range:NSMakeRange(0, title.length)];
        
        [alert setValue:titleAttribute forKey:@"attributedTitle"];
    }
    
    
    if (message) {
    NSMutableAttributedString *messageAttribute = [[NSMutableAttributedString alloc]initWithString:message];
    
    [messageAttribute addAttribute:NSForegroundColorAttributeName value:RGBA(39, 39, 39, 1) range:NSMakeRange(0, message.length)];
    
    [messageAttribute addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14]range:NSMakeRange(0, message.length)];
    
    [alert setValue:messageAttribute forKey:@"attributedMessage"];
    }

    switch (action_button) {
            
        case Action_Ok:
        {
            
            [alert addActionWithTitle:@"确认" ForAction:handlerOk];
            
        }
            break;
        case Action_Custom:
        {
            
            [alert addActionWithTitle:customTitle ForAction:handlerCustom];
            
        }
            break;
        case (Action_Ok | Action_Custom):
        {
            [alert addActionWithTitle:customTitle ForAction:handlerCustom];
            [alert addActionWithTitle:@"确认" ForAction:handlerOk];
            
        }
            break;
        case Action_Cancle:
        {
            
            [alert addActionWithTitle:@"取消" ForAction:nil];
            
        }
            break;
        case (Action_Ok | Action_Cancle):
        {
            [alert addActionWithTitle:@"取消" ForAction:nil];
            [alert addActionWithTitle:@"确认" ForAction:handlerOk];
            
        }
            break;
        case (Action_Custom | Action_Cancle):
        {
            [alert addActionWithTitle:@"取消" ForAction:nil];
            [alert addActionWithTitle:customTitle ForAction:handlerCustom];
            
        }
            break;
        case (Action_Ok | Action_Custom | Action_Cancle):
        {
            [alert addActionWithTitle:@"确认" ForAction:handlerOk];
            [alert addActionWithTitle:customTitle ForAction:handlerCustom];
            [alert addActionWithTitle:@"取消" ForAction:nil];
            
        }
            break;
            
        default:
            break;
    }
    
    [controller presentViewController:alert animated:YES completion:nil];
    
    return alert;
    
}


/**
 * 此方法 默认带有一个确认按钮 , 点击确认按钮弹框消失
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller{
    
    
    return [UIAlertController createAlertWithTitle:title
                                           Message:message
                                 currentController:controller
                                      ActionButton:Action_Ok
                                 CustomButtonTitle:nil
                                         handlerOK:nil
                                     handlerCustom:nil];
    
}

/**
 * 此方法 默认带有一个确认按钮 , 可设置 确认按钮的点击事件.
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                            OKAction:(void (^)(UIAlertAction *))action{
    
    
    return [UIAlertController createAlertWithTitle:title
                                           Message:message
                                 currentController:controller
                                      ActionButton:Action_Ok
                                 CustomButtonTitle:nil
                                         handlerOK:action
                                     handlerCustom:nil];
    
}




/**
 *  此方法 默认带有 确认按钮与 取消按钮 , 可以设置确定按钮的点击事件.
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                              Action:(void (^)(UIAlertAction *))action{
    
    
    return [UIAlertController createAlertWithTitle:title
                                           Message:message
                                 currentController:controller
                                      ActionButton:Action_Ok|Action_Cancle
                                 CustomButtonTitle:nil
                                         handlerOK:action
                                     handlerCustom:nil];
    
}


/**
 *  此方法 默认带有 自定义按钮与 取消按钮 , 可以设置自定义按钮的点击事件.
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                    CustomButonTitle:(NSString *)customTitle
                              Action:(void (^)(UIAlertAction *action))action{
    
    return [UIAlertController createAlertWithTitle:title
                                           Message:message
                                 currentController:controller
                                      ActionButton:Action_Custom | Action_Cancle CustomButtonTitle:customTitle
                                         handlerOK:nil
                                     handlerCustom:action];
    
}

/**
 *  此方法 默认带有 确认按钮与取消按钮 , 可设置确认按钮与 取消按钮的点击事件.
 */
+ (instancetype)createAlertWithTitle:(NSString *)title
                             Message:(NSString *)message
                   currentController:(UIViewController *)controller
                              Action:(void (^)(UIAlertAction *action))action
                           EndAction:(void (^)(UIAlertAction *action))end_action{
    
    
    return [UIAlertController createAlertWithTitle:title
                                           Message:message
                                 currentController:controller
                                      ActionButton:Action_Ok|Action_Custom
                                 CustomButtonTitle:@"取消"
                                         handlerOK:action
                                     handlerCustom:end_action];
    
}






#pragma mark - Private Function

- (void)addActionWithTitle:(NSString *)title
                 ForAction:(void (^)(UIAlertAction *))action
{
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:action];
    //修改按钮
    if ([title isEqualToString:@"取消"]) {
        [defaultAction setValue:RGB(140, 140, 140) forKey:@"titleTextColor"];
    }else{
         [defaultAction setValue:Default_LabelColor forKey:@"titleTextColor"];
    }
    [self addAction:defaultAction];
    
}



@end
