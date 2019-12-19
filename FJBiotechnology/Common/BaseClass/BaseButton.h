//
//  BaseButton.h
//  译同行
//
//  Created by 曹宇 on 2017/5/24.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseButton : UIButton
@property (nonatomic, copy)NSString * title;
@property (nonatomic, strong)UIColor * titleColor;
@property (nonatomic, strong)UIColor * highLighttitleColor;
@property (nonatomic, strong)UIFont * titleFont;
+(instancetype)button;

typedef void (^CustomButtonBlock)(BaseButton *button);//声明Block
@property(nonatomic,copy)CustomButtonBlock buttonClick;
@end
