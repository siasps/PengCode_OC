//
//  BaseCollectionView.m
//  译同行
//
//  Created by 曹宇 on 2017/5/24.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "BaseCollectionView.h"

@implementation BaseCollectionView

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (self.contentOffset.x <= 0) {
        if ([otherGestureRecognizer.delegate isKindOfClass:NSClassFromString(@"_FDFullscreenPopGestureRecognizerDelegate")]) {
            return YES;
        }
    }
    return NO;
}

@end
