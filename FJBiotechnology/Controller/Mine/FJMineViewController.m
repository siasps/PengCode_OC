//
//  FJMineViewController.m
//  FJBiotechnology
//
//  Created by peng on 2019/2/25.
//  Copyright © 2019 peng. All rights reserved.
//

#import "FJMineViewController.h"
#import "FJUserHeaderCell.h"

#import "FJAddressViewController.h"
#import "FJMyHealthViewController.h"
#import "FJAboutMeViewController.h"
#import "FJOpinionViewController.h"
#import "FJChnagePswViewController.h"

@interface FJMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic ,strong) UITableView *tableView;
@property (nonatomic ,strong) NSArray *mArrOfButtonTitle;
@property (nonatomic ,strong) NSArray *mArrOfButtonImage;

@end

@implementation FJMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.naviTitle = @"我的";
    
    [self initTitleList];
    [self initImageList];
    [self createTableView];
}

-(void)initTitleList{
    
  
    self.mArrOfButtonTitle = @[
                               @[@"0"],
                               @[@"我的地址",@"我的健康信息"],
                               @[@"关于我们"],
                               @[@"用户反馈"],
                               @[@"修改密码",@"退出登录"]
                               ];
    
}

-(void)initImageList{
    
    
    self.mArrOfButtonImage = @[
                               @[@"0"],
                               @[@"user_address_icon.png",@"user_health_icon.png"],
                               @[@"user_about_icon.png"],
                               @[@"user_back_icon.png"],
                               @[@"user_change_icon.png",@"user_exit_icon.png"]
                               ];
    
}

- (void)createTableView{
    self.tableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-TabbarHeight) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = RGB_COLOR_String(@"#F5F5F5");
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass: [FJUserHeaderCell class] forCellReuseIdentifier:@"UserHeaderCell"];
    [self.tableView registerClass: [FJUserNormalCell class] forCellReuseIdentifier:@"UserNormalCell"];
    [self.view addSubview:self.tableView];
    
    if (@available(iOS 11.0, *)){
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else{
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    //    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 2;
    }else if (section == 2){
        return 1;
    }else if (section == 3){
        return 1;
    }else if (section == 4){
        return 2;
    }else{
        return 0;
    }
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
    if (indexPath.section == 0) {
        return 175;
    }else{
        
        return 44;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        FJUserHeaderCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserHeaderCell" forIndexPath:indexPath];
        return cell;
    }else{
        
        NSArray *iconArray = [_mArrOfButtonImage objectAtIndex:indexPath.section];
        NSString *iconString = [iconArray objectAtIndex:indexPath.row];
        NSArray *titleArray = [_mArrOfButtonTitle objectAtIndex:indexPath.section];
        NSString *titleString = [titleArray objectAtIndex:indexPath.row];
        
        FJUserNormalCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserNormalCell" forIndexPath:indexPath];
        [cell reloadWithInformation:nil imageIconString:iconString titleString:titleString];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 1 && indexPath.row == 0) {
        FJAddressViewController *vc = [[FJAddressViewController alloc] init];
        [self.navigationController pushController:vc];
    }else if (indexPath.section == 1 && indexPath.row == 1){
        FJMyHealthViewController *vc = [[FJMyHealthViewController alloc] init];
        [self.navigationController pushController:vc];
    }else if (indexPath.section == 2){
        FJAboutMeViewController *vc = [[FJAboutMeViewController alloc] init];
        [self.navigationController pushController:vc];
    }else if (indexPath.section == 3){
        FJOpinionViewController *vc = [[FJOpinionViewController alloc] init];
        [self.navigationController pushController:vc];
    }else if (indexPath.section == 4 && indexPath.row == 0){
        FJChnagePswViewController *vc = [[FJChnagePswViewController alloc] init];
        [self.navigationController pushController:vc];
    }else if (indexPath.section == 4 && indexPath.row == 1){
        
        [self exitButtonClick];//退出登录
    }
    
}

-(void)exitButtonClick{
    
    NSString *mes = @"是否确定退出账号？";
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"退出" message:mes preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    UIAlertAction *sureAction  = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        //退出登录响应
        
        [self popViewControllerAnimated:YES];
        [MBProgressHUD showAlterWithMessage:@"退出登录成功"];
        [UserManager logout];
        
//        if (self.delegate && [self.delegate respondsToSelector:@selector(exitButtonClickDelegate)]) {
//            [self.delegate exitButtonClickDelegate];
//        }
        
        
    }];
    [alert addAction:sureAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
}





@end
