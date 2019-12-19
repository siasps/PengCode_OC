//
//  BaseTextView.m
//  
//
//  Created by 曹宇 on 2017/5/24.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "BaseTextView.h"

@implementation BaseTextView


- (instancetype)init{
    self = [super init];
    if (self) {
         [self config];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config{
    self.scrollEnabled = YES;
}

@end
