//
//  FJChooseMethodViewController.m
//  FJBiotechnology
//
//  Created by peng on 2019/2/26.
//  Copyright © 2019 peng. All rights reserved.
//

#import "FJChooseMethodViewController.h"
#import "FJLoginViewController.h"
#import "FJRegisterViewController.h"

@interface FJChooseMethodViewController ()

@end

@implementation FJChooseMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

-(void)createUI{
    
    UIImageView *imageLogin = [[UIImageView alloc] init];
    imageLogin.image = [UIImage imageNamed:@"logo_Icon.png"];
    imageLogin.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageLogin];
    [imageLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(122);
        make.left.mas_equalTo(84);
        make.right.mas_equalTo(-104);
        make.height.mas_equalTo(180);
        
    }];
    
    
    UIButton *registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [registerButton setTitle:@"注册" forState:UIControlStateNormal];
    [registerButton setTitleColor:ThemeColor forState:UIControlStateNormal];
    registerButton.backgroundColor = [UIColor clearColor];
    [registerButton addTarget:self action:@selector(registerButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerButton];
    registerButton.layer.masksToBounds = YES;
    registerButton.layer.cornerRadius = 20;
    registerButton.layer.borderColor = ThemeColor.CGColor;
    registerButton.layer.borderWidth = 1;
    
    [registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.mas_equalTo(37);
        make.right.mas_equalTo(-37);
        make.top.mas_equalTo(imageLogin.mas_bottom).mas_offset(39);
    }];
    
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginButton setTitleColor:ThemeColor forState:UIControlStateNormal];
    loginButton.backgroundColor = [UIColor clearColor];
    [loginButton addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:loginButton];
    loginButton.layer.masksToBounds = YES;
    loginButton.layer.cornerRadius = 20;
    loginButton.layer.borderColor = ThemeColor.CGColor;
    loginButton.layer.borderWidth = 1;
    
    [loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(50);
        make.left.mas_equalTo(37);
        make.right.mas_equalTo(-37);
        make.top.mas_equalTo(registerButton.mas_bottom).mas_offset(25);
    }];
    
    
    
    
    UIImage *image = [UIImage imageNamed:@"login_bottom.png"];
    CGFloat height = image.size.height/image.size.width *SCREEN_WIDTH;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT -height, SCREEN_WIDTH, height)];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    
    UILabel *explainLabel = [[UILabel alloc] init];
    explainLabel.textColor = [UIColor whiteColor];
    explainLabel.font = [UIFont systemFontOfSize:12];
    explainLabel.textAlignment = NSTextAlignmentCenter;
    explainLabel.text = @"继续即代表您同意我们的服务条款和隐私政策";
    [self.view addSubview:explainLabel];
    
    [explainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.top.mas_equalTo(SCREEN_HEIGHT -SCREEN_BOTTOM_HEIGHT - 30);
    }];
    
    
    
    
    
}


-(void)registerButtonClick{
    FJRegisterViewController *vc = [[FJRegisterViewController alloc] init];
    [self presentViewController:vc animated:YES];
}

-(void)loginButtonClick{
    FJLoginViewController *vc = [[FJLoginViewController alloc] init];
    [self presentViewController:vc animated:YES];
}

@end
