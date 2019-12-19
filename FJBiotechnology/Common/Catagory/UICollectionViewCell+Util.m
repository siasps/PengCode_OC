//
//  UICollectionViewCell+Util.m
//  译同行
//
//  Created by 曹宇 on 2017/9/22.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "UICollectionViewCell+Util.h"

@implementation UICollectionViewCell (Util)
- (void)setCellCornerRadius:(CGFloat)cornerRadius
                borderColor:(UIColor *)lineColor
                borderWidth:(CGFloat)width{
    CGFloat cellWidth = self.width;;
    CGFloat cellHeight = self.height;
    
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, cellWidth, cellHeight);
    
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, cellWidth, cellHeight);
    borderLayer.lineWidth = 1.f;
    borderLayer.strokeColor = lineColor.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, cellWidth, cellHeight) cornerRadius:cornerRadius];
    maskLayer.path = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    [self.contentView.layer insertSublayer:borderLayer atIndex:0];
    [self.layer setMask:maskLayer];
}
@end
