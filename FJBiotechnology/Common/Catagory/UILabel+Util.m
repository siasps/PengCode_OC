//
//  UILabel+Util.m
//  译同行
//
//  Created by 曹宇 on 2017/7/6.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "UILabel+Util.h"

@implementation UILabel (Util)


-(CGSize) textSize {
    return [self.text sk_sizeWithFont:self.font];
}

- (void)setUnderLineText:(NSString *)string{
    NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
    self.attributedText = [[NSMutableAttributedString alloc]initWithString:string attributes:attribtDic];
}

@end
