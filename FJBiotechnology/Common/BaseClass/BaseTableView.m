//
//  BaseTableView.m
//  译同行
//
//  Created by 曹宇 on 2017/5/24.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "BaseTableView.h"

@interface BaseTableView ()

@end

@implementation BaseTableView

/**
 iOS11 heightForHeaderInSection设置高度无效,根本不执行
 - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
 
 
 PS:iOS11默认开启Self-Sizing，关闭Self-Sizing即可。
 self.tableView.estimatedRowHeight = 0;
 self.tableView.estimatedSectionHeaderHeight = 0;
 self.tableView.estimatedSectionFooterHeight = 0;
 */

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        [self setSeparatorInset:UIEdgeInsetsZero];
        [self setSeparatorColor:TableViewLineColor];
        

    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.estimatedRowHeight = 0;
        self.estimatedSectionHeaderHeight = 0;
        self.estimatedSectionFooterHeight = 0;
        [self setSeparatorInset:UIEdgeInsetsZero];
        [self setSeparatorColor:TableViewLineColor];
    }
    return self;
}



@end
