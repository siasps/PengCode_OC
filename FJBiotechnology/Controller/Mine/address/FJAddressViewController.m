//
//  FJAddressViewController.m
//  FJBiotechnology
//
//  Created by peng on 2019/2/27.
//  Copyright © 2019 peng. All rights reserved.
//

#import "FJAddressViewController.h"
#import "FJAddressListCustomCell.h"
#import "FJAddAddressViewController.h"

@interface FJAddressViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;

@end

@implementation FJAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviTitle = @"我的地址";
    [self showCustomBackButton];
    [self createTableView];
    [self setNavRightItem:@selector(clickNavRightItem) title:@"新增" color:[UIColor blackColor]];
}

-(void)clickNavRightItem{
    FJAddAddressViewController *vc = [[FJAddAddressViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)createTableView{
    self.tableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabbarHeight) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = RGB_COLOR_String(@"#F5F5F5");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass: [FJAddressListCustomCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    if (@available(iOS 11.0, *)){
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 15;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 14.f;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
{
    return [[UIView alloc] init];
}
- (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
{
    return [[UIView alloc] init];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    FJAddressListCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
}


@end
