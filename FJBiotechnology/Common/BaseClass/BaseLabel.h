//
//  BaseLabel.h
//  
//
//  Created by 曹宇 on 2017/5/24.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <YYText/YYText.h>
@interface BaseLabel : YYLabel
- (void)setUnderLineText:(NSString *)string;
//@property (nonatomic) UIEdgeInsets edgeInsets;
@property (readonly) CGSize textSize;
@end
