//
//  UIView+Util.m
//  yitongxing
//
//  Created by 曹宇 on 2017/5/19.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "UIView+Util.h"

@implementation UIView (Util)
/* x的setter和getter方法 */
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (CGFloat)x
{
    return self.frame.origin.x;
}

/* y的setter和getter方法 */
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (CGFloat)y
{
    return self.frame.origin.y;
}

/* width的setter和getter方法 */
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (CGFloat)width
{
    return self.frame.size.width;
}

/* height的setter和getter方法 */
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
-(CGFloat)height
{
    return self.frame.size.height;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)centerY
{
    return self.center.y;
}


/* size的setter和getter方法 */
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
- (CGSize)size
{
    return self.frame.size;
}

/* origin的setter和getter方法 */
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (CGPoint)origin
{
    return self.frame.origin;
}



-(void) setNeedsDisplayAndLayout {
    [self setNeedsDisplay];
    [self setNeedsLayout];
}

-(CGPoint) toucheLocation:(UITouch*)touch {
    return [touch locationInView:self];
}
-(CGPoint) toucheLocationInSuper:(UITouch*)touch {
    return [touch locationInView:self.superview];
}

-(CGPoint)toucheLocationInWindow:(UITouch*)touch {
    return [touch locationInView:self.window];
}


-(CGRect) frameInSuperView:(UIView*)superView {
    CGRect originRect = self.frame;
    originRect.origin.x = 0;
    originRect.origin.y = 0;
    return superView == nil ? originRect : [self convertRect:originRect toView:superView];
}

-(CGRect) frameInWindow {
    return [self frameInSuperView:self.window];
}

-(void) setForCustomConstraints {
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.opaque = NO;
}

-(void) addToSuperview:(UIView *)superview {
    [superview addSubview:self];
}

-(UIViewController*)viewController
{
    UIResponder *nextResponder =  self;
    
    do
    {
        nextResponder = [nextResponder nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            return (UIViewController*)nextResponder;
        
    } while (nextResponder != nil);
    
    return nil;
}


//位于view下面，间距为padding
- (void)underView:(UIView *)view padding:(CGFloat)padding{
    CGRect superRect = view.frame;
    
    CGRect rect = self.frame;
    
    CGRect currRect = CGRectMake(superRect.origin.x,
                                 CGRectGetMaxY(superRect) + padding,
                                 rect.size.width,
                                 rect.size.height);
    self.frame = currRect;
}

//垂直居中对齐 view：相对view padding：间距
- (void)verticalAllignment:(UIView *)view{
    CGRect superRect = view.frame;
    
    CGRect rect = self.frame;
    
    CGRect currRect = CGRectMake((superRect.size.width - rect.size.width)/2 + superRect.origin.x,
                                 rect.origin.y,
                                 rect.size.width,
                                 rect.size.height);
    self.frame = currRect;
}
@end



