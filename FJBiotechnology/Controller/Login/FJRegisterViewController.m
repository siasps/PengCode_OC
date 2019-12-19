//
//  FJRegisterViewController.m
//  FJBiotechnology
//
//  Created by peng on 2019/2/26.
//  Copyright © 2019 peng. All rights reserved.
//

#import "FJRegisterViewController.h"

@interface FJRegisterViewController ()<UITextFieldDelegate>{
    
}
@property (nonatomic ,strong) UITextField *userField;
@property (nonatomic ,strong) UITextField *passField;
@property (nonatomic ,strong) UIButton *loginButton;

@end

@implementation FJRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initNavLeftItem];
    [self initSubviews];
}

-(void)initNavLeftItem{
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateNormal];
    [backButton setImage:[UIImage imageNamed:@"backButton.png"] forState:UIControlStateHighlighted];
    [backButton setFrame:CGRectMake(20, SCREEN_STATUS_HEIGHT +8, 30, 30)];
    backButton.backgroundColor = [UIColor clearColor];
    //    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
}
-(void)backButtonClick{
    [self dismissViewControllerAnimated:YES];
}

- (void)initSubviews{
    UIImageView *topImage = [[UIImageView alloc]init];
    topImage.image = [UIImage imageNamed:@"logo_Icon.png"];
    topImage.frame = CGRectMake(SCREEN_WIDTH/2 -75, 130, 150, 150);
    topImage.contentMode = UIViewContentModeScaleAspectFit;
    //topImage.backgroundColor = ThemeColor;
    [self.view addSubview:topImage];
    
    
    
    UIImageView *userLeft = [[UIImageView alloc]init];
    userLeft.frame = CGRectMake(0, 0, 32, 32);
    userLeft.image = [UIImage imageNamed:@"login_number.png"];
    userLeft.contentMode = UIViewContentModeCenter;
    
    
    _userField = [[UITextField alloc]init];
    _userField.frame = CGRectMake(40, CGRectGetMaxY(topImage.frame) +50, SCREEN_WIDTH-80, 45);
    _userField.backgroundColor = [UIColor clearColor];
    _userField.leftViewMode = UITextFieldViewModeAlways;
    _userField.leftView = userLeft;
    _userField.delegate = self;
    _userField.placeholder = @"请输入账号";
    _userField.font = [UIFont systemFontOfSize:15];
    _userField.textColor = RGB_COLOR_String(@"666666");
    _userField.returnKeyType = UIReturnKeyNext;
    [_userField addTarget:self action:@selector(textField1TextChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_userField];
    _userField.layer.cornerRadius = 22.0f;
    
    
    UIView *lineView_1 = [[UIView alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(_userField.frame), SCREEN_WIDTH -80, 1)];
    lineView_1.backgroundColor = TableSeparatorLineColor;
    [self.view addSubview:lineView_1];
    
    
    UIImageView *passLeft = [[UIImageView alloc]init];
    passLeft.frame = CGRectMake(0, 0, 35, 35);
    passLeft.image = [UIImage imageNamed:@"login_psw.png"];
    passLeft.contentMode = UIViewContentModeCenter;
    
    
    _passField = [[UITextField alloc]init];
    _passField.frame = CGRectMake(40, CGRectGetMaxY(_userField.frame) + 15, SCREEN_WIDTH-120, 45);
    _passField.backgroundColor = [UIColor clearColor];
    _passField.leftViewMode = UITextFieldViewModeAlways;
    _passField.leftView = passLeft;
    _passField.delegate = self;
    _passField.placeholder = @"请输入密码";
    _passField.font = [UIFont systemFontOfSize:15];
    _passField.textColor = RGB_COLOR_String(@"666666");
    _passField.returnKeyType = UIReturnKeyDone;
    _passField.keyboardType = UIKeyboardTypeASCIICapable;
    _passField.secureTextEntry = YES;
    [_passField addTarget:self action:@selector(textField1TextChange:) forControlEvents:UIControlEventEditingChanged];
    [self.view addSubview:_passField];
    
    UIView *lineView_2 = [[UIView alloc] initWithFrame:CGRectMake(40, CGRectGetMaxY(_passField.frame), SCREEN_WIDTH -80, 1)];
    lineView_2.backgroundColor = TableSeparatorLineColor;
    [self.view addSubview:lineView_2];
    
    
    UIButton *secretButton = [UIButton buttonWithType:UIButtonTypeCustom];
    secretButton.backgroundColor = [UIColor clearColor];
    [secretButton setImage:[UIImage imageNamed:@"login_secret.png"] forState:UIControlStateNormal];
    [secretButton setImage:[UIImage imageNamed:@"login_secret.png"] forState:UIControlStateHighlighted];
    [secretButton setImage:[UIImage imageNamed:@"login_secret_no.png"] forState:UIControlStateSelected];
    [secretButton addTarget:self action:@selector(secretButtonClcik:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:secretButton];
    
    [secretButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passField.mas_top).mas_offset(13);
        make.left.mas_equalTo(self.passField.mas_right).mas_offset(10);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(40, CGRectGetMaxY(_passField.frame)+30, SCREEN_WIDTH-80, 50);
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [loginBtn setTitleColor:ThemeColor forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [loginBtn setBackgroundColor:[UIColor clearColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    [loginBtn addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.layer.cornerRadius = 25.0f;
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.borderWidth = 1.0f;
    loginBtn.layer.borderColor = ThemeColor.CGColor;
    _loginButton = loginBtn;
    
    
    
    
    
}

-(void)secretButtonClcik:(UIButton *)sender{
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        _passField.secureTextEntry = NO;
    }else{
        _passField.secureTextEntry = YES;
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _userField) {
        [textField resignFirstResponder];
        [_passField becomeFirstResponder];
    }else if (textField == _passField) {
        [textField resignFirstResponder];
        
        [self loginButtonClick];
        return YES;
    }
    
    return NO;
}

-(void)textField1TextChange:(UITextField *)textField{
    
    //    if (_userField.text.length > 0 && _passField.text.length > 0) {
    //        [self setLoginButtonStatus:YES];
    //    }else{
    //        [self setLoginButtonStatus:NO];
    //    }
}


-(void)setLoginButtonStatus:(BOOL)statusBool{
    if (statusBool) {
        _loginButton.userInteractionEnabled = YES;
        [_loginButton setBackgroundColor:ThemeColor forState:UIControlStateNormal];
    }else{
        _loginButton.userInteractionEnabled = NO;
        [_loginButton setBackgroundColor:RGB_COLOR_String(@"#dddddd") forState:UIControlStateNormal];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_userField resignFirstResponder];
    [_passField resignFirstResponder];
}



#pragma mark - 网络请求
-(void)loginButtonClick{
    
    [_userField resignFirstResponder];
    [_passField resignFirstResponder];
    
    
    if (_userField.text.length == 0) {
        [MBProgressHUD showAlterWithMessage:@"请输入手机号"];
        return;
    }
    if (![_userField.text isInteger] || _userField.text.length != 11)
    {
        [MBProgressHUD showAlterWithMessage:@"请输入正确格式的手机号码"];
        return;
    }
    
    NSString *alertStr = @"";
    if (_passField.text.length == 0){
        alertStr = @"请正确输入密码";
    }
    if (alertStr.length > 0) {
        [MBProgressHUD showAlterWithMessage:alertStr];
        return;
    }
    
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[UserManager getApikey] forKey:@"apikey"];
    [dict setObject:[UserManager getApisecret] forKey:@"apisecret"];
    [dict setObject:self.userField.text forKey:@"UserNo"];
    [dict setObject:self.passField.text forKey:@"UserPassword"];
    
    [HHttpManager POST:@"http://www.future-plus.com.cn/api/register.php" parameters:dict success:^(id responseObject) {
        
        NSDictionary *respondDict = responseObject;
        NSString *OperateResult = [respondDict stringValueForKey:@"OperateResult"];
        NSString *OperateMsg    = [respondDict stringValueForKey:@"OperateMsg"];
        if ([OperateResult isEqualToString:@"1"]) {
            
            [UserManager saveUserInfo:dict];
            [self dismissViewControllerAnimated:YES];
            [MBProgressHUD showAlterWithMessage:OperateMsg];
        }else{
            [MBProgressHUD showAlterWithMessage:OperateMsg];
            
        }
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
    //    [HMDataRequest postRequestWithUrl:Server_login withParams:dict withCacheTime:0 showProgressInView:self.view CallBack:^(id responseObject, id error) {
    //        if (error==nil) {
    //            NSDictionary *respondDict = responseObject;
    //            NSDictionary *infoMap= [respondDict objectForKey:@"infoMap"];
    //            NSString *flag = [infoMap objectForKey:@"flag"];
    //            NSArray *resultList = [respondDict objectForKey:@"resultList"];
    //
    //            if ([flag isEqualToString:@"1"]){
    //                NSDictionary *supplierAccount = [infoMap valueObjectForKey:@"supplierAccount"];
    //                if (supplierAccount && supplierAccount.count>0) {
    //                    [HMLoginManage saveUserInfomation:supplierAccount];
    //                }
    //                AppDelegate *delegate =  (AppDelegate*)[[UIApplication sharedApplication]delegate];
    //                [delegate setRootControllerWithLoginStatus:YES];
    //
    //            }else{
    //                [MBProgressHUD showAlterWithMessage:[infoMap stringValueForKey:@"reason"]];
    //            }
    //        }else{
    //            [MBProgressHUD showAlterWithMessage:@"网络异常，请稍后再试！"];
    //        }
    //    }];
    
}

@end
