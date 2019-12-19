//
//  BaseLabel.m
//  
//
//  Created by 曹宇 on 2017/5/24.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "BaseLabel.h"

@implementation BaseLabel

- (instancetype)init{
    self = [super init];
    if (self) {
        self.displaysAsynchronously = YES;
        self.lineBreakMode = NSLineBreakByTruncatingTail; //超出的部分
//        [self longPressHander];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.displaysAsynchronously = YES;
        self.lineBreakMode = NSLineBreakByTruncatingTail; //超出的部分
//        [self longPressHander];
    }
    return self;
}


-(CGSize) textSize {
    return [self.text sk_sizeWithFont:self.font];
}

- (void)setUnderLineText:(NSString *)string{
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:string];
    YYTextDecoration *decoration = [YYTextDecoration decorationWithStyle:YYTextLineStyleSingle
                                                                   width:@(1)
                                                                   color:Label_GrayColor];
    //删除样式
    [str yy_setTextStrikethrough:decoration range:NSMakeRange(0, str.length)];
    [str yy_setColor:Label_GrayColor range:NSMakeRange(0, str.length)];
    self.attributedText = str;
    
}
//
//-(BOOL)canBecomeFirstResponder{
//    return YES;
//}
//-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
//    return (action == @selector(copy:));
//}
//
//-(void)copy:(id)sender{
//    
//    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
//    pasteBoard.string = self.text;
//}
//
//-(void)longPressHander{
//    self.userInteractionEnabled = YES;
//    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
//    [self addGestureRecognizer:longPress];
//}
//
//-(void)longPressAction:(UILongPressGestureRecognizer *)recognizer{
//    [self becomeFirstResponder];
//    UIMenuItem *copyLink = [[UIMenuItem alloc] initWithTitle:@"复制全部" action:@selector(copy:)];
//    [[UIMenuController sharedMenuController] setMenuItems:[NSArray arrayWithObjects:copyLink, nil]];
//    [[UIMenuController sharedMenuController] setTargetRect:self.frame inView:self.superview];
//    [[UIMenuController sharedMenuController] setMenuVisible:YES animated:YES];
//}



@end
