//
//  UICollectionViewCell+Util.h
//  译同行
//
//  Created by 曹宇 on 2017/9/22.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewCell (Util)
- (void)setCellCornerRadius:(CGFloat)cornerRadius
                borderColor:(UIColor *)lineColor
                borderWidth:(CGFloat)width;
@end
