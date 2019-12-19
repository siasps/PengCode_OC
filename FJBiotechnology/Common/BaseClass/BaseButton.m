//
//  BaseButton.m
//  译同行
//
//  Created by 曹宇 on 2017/5/24.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "BaseButton.h"

@implementation BaseButton

+(instancetype)button{
   return [self buttonWithType:UIButtonTypeCustom];
}


+(instancetype)buttonWithType:(UIButtonType)buttonType{
    BaseButton *button = [super buttonWithType:buttonType];
    if (button) {
        //关闭多点触控
        [button setExclusiveTouch:YES];
    }
    return button;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    [self setTitle:title forState:UIControlStateNormal];
}
- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    [self setTitleColor:titleColor forState:UIControlStateNormal];
}
- (void)setHighLighttitleColor:(UIColor *)highLighttitleColor{
    _highLighttitleColor = highLighttitleColor;
    [self setTitleColor:highLighttitleColor forState:UIControlStateHighlighted];
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    self.titleLabel.font = titleFont;
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.layer removeAllAnimations];
//    CABasicAnimation *animationZoomIn=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animationZoomIn.duration=0.12f;
//    animationZoomIn.beginTime= CACurrentMediaTime();
//    animationZoomIn.autoreverses=NO;
//    animationZoomIn.repeatCount=1;
//    animationZoomIn.toValue=@0.95;
//    animationZoomIn.removedOnCompletion = NO;
//    animationZoomIn.fillMode = kCAFillModeForwards;
//    animationZoomIn.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    [self.layer addAnimation:animationZoomIn forKey:@"click-scale-anim"];
//}
//
//-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.layer removeAllAnimations];
//    CABasicAnimation *animationZoomOut=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animationZoomOut.duration=0.12f;
//    animationZoomOut.beginTime= CACurrentMediaTime();
//    animationZoomOut.autoreverses=NO;
//    animationZoomOut.repeatCount=1;
//    animationZoomOut.fromValue=@0.95;
//    animationZoomOut.toValue=@1.0;
//    animationZoomOut.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    [self.layer addAnimation:animationZoomOut forKey:@"click-scale-anim1"];
//
//
//    //获取触摸对象
//    UITouch *touche = [touches anyObject];
//    //获取touche的位置
//    CGPoint point = [touche locationInView:self];
//
//    //判断点是否在button中
//    if (CGRectContainsPoint(self.bounds, point))
//    {
//        //执行action
//        if (self.buttonClick) {
//            self.buttonClick(self);
//        }
//    }
//}
//
//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.layer removeAllAnimations];
//    CABasicAnimation *animationZoomOut=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animationZoomOut.duration=0.12f;
//    animationZoomOut.beginTime= CACurrentMediaTime();
//    animationZoomOut.autoreverses=NO;
//    animationZoomOut.repeatCount=1;
//    animationZoomOut.fromValue=@0.9;
//    animationZoomOut.toValue=@1.0;
//    animationZoomOut.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    [self.layer addAnimation:animationZoomOut forKey:@"click-scale-anim1"];
//}



@end
