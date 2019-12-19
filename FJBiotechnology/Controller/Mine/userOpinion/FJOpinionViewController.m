//
//  FJOpinionViewController.m
//  FJBiotechnology
//
//  Created by peng on 2019/2/27.
//  Copyright © 2019 peng. All rights reserved.
//

#import "FJOpinionViewController.h"

@interface FJOpinionViewController ()<UITextViewDelegate>
{
    UITextView *_textView;
    UILabel *_mLabel;
    NSInteger MaxNumberOfDescriptionChars;
    
    UILabel *numberOfCharsLabel;
}

@end

@implementation FJOpinionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.naviTitle = @"意见反馈";
    [self showCustomBackButton];
    [self initUIView];
    self.view.backgroundColor = [UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1];
    
}

-(void)initUIView
{
    _textView = [[UITextView alloc] initWithFrame:CGRectMake(20, 100, SCREEN_WIDTH -40, 100)];
    _textView.textColor = [UIColor colorWithRed:80.0/255.0f green:80.0/255.0f blue:80.0/255.0f alpha:1];
    _textView.font = [UIFont fontWithName:@"Arial" size:15.0];
    _textView.delegate = self;
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.returnKeyType = UIReturnKeyDone;
    _textView.keyboardType = UIKeyboardTypeDefault;
    _textView.scrollEnabled = YES;
    //    _textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_textView];
    MaxNumberOfDescriptionChars=200;
    
    _textView.layer.masksToBounds =YES;
    _textView.layer.cornerRadius = 2.2;
    _textView.layer.borderWidth = .5;
    _textView.layer.borderColor = [UIColor grayColor].CGColor;
    
    //    UILabel *promptLab=[[UILabel alloc] init];
    //    promptLab.frame=CGRectMake(8, 195, (SCREEN_WIDTH-16)/2, 10);
    //    promptLab.font=[UIFont systemFontOfSize:12];
    //    promptLab.text=@"请简述，200字内";
    //    [self.view addSubview:promptLab];
    
    numberOfCharsLabel=[[UILabel alloc]init];
    numberOfCharsLabel.frame=CGRectMake(8, 195, (SCREEN_WIDTH-16)/2, 10);
    numberOfCharsLabel.font=[UIFont systemFontOfSize:12];
    numberOfCharsLabel.textAlignment=NSTextAlignmentLeft;
    numberOfCharsLabel.text=[NSString stringWithFormat:@"(最多200字，剩余200字)"];
    numberOfCharsLabel.textColor = RGB_COLOR_String(@"#6C6C6C");
    [self.view addSubview:numberOfCharsLabel];
    
    _mLabel= [[UILabel alloc] init];
    _mLabel.frame =CGRectMake(3, 107, SCREEN_WIDTH -4, 20);
    _mLabel.text = @"请在这里留下您的宝贵意见，来帮助我们提供给您更好的服务";
    _mLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _mLabel.numberOfLines = 0;
    _mLabel.font = [UIFont fontWithName:@"Arial" size:13.0];
    _mLabel.textColor = [UIColor colorWithRed:80.0/255.0f green:80.0/255.0f blue:80.0/255.0f alpha:1];
    _mLabel.enabled = NO;
    _mLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_mLabel];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(25, 220, SCREEN_WIDTH -50, 45);
    [button setBackgroundColor:ThemeColor forState:UIControlStateNormal];
    [button setTitle:@"提交" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.layer.cornerRadius = 22.0f;
    button.layer.masksToBounds = YES;
    [button addTarget:self action:@selector(sendMassage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

-(void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length == 0)
    {
        _mLabel.text = @"请在这里留下您的宝贵意见，来帮助我们提供给您更好的服务";
    }
    else
    {
        _mLabel.text = @"";
    }
    
    //用于联想判断
    if (textView.text.length > MaxNumberOfDescriptionChars)
    {
        [self performSelector:@selector(replaceText:) withObject:textView.text afterDelay:0];
    }
}

- (void)replaceText:(NSString *)text{
    _textView.text = [text substringToIndex:MaxNumberOfDescriptionChars];
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    UIButton* right_btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [right_btn setFrame:CGRectMake(0, 0, 40, 44)];
    [right_btn setTitle:@"完成" forState:UIControlStateNormal];
    [right_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [right_btn addTarget:self action:@selector(leaveEditMode) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:right_btn];
    
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    self.navigationItem.rightBarButtonItem = nil;
}

- (void)leaveEditMode
{
    [_textView resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([[_textView text] length]>MaxNumberOfDescriptionChars){
        return NO;
    }
    
    char c=[text UTF8String][0];
    if (c=='\000') {
        numberOfCharsLabel.text=[NSString stringWithFormat:@"(最多200字，剩余%lu字)",(unsigned long)(MaxNumberOfDescriptionChars-[[textView text] length])];
        return YES;
    }
    if([[textView text] length]==MaxNumberOfDescriptionChars) {
        if(![text isEqualToString:@"\b"]) return NO;
    }
    
    numberOfCharsLabel.text=[NSString stringWithFormat:@"(最多200字，剩余%lu字)",(unsigned long)(MaxNumberOfDescriptionChars-[[textView text] length]-[text length])];
    //    return YES;
    
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void) sendMassage:(id) sender
{
    if (_textView.text.length == 0)
    {
        [MBProgressHUD showAlterWithMessage:@"意见不能为空，请继续填写！"];
        return;
    }
    
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UserManager getUserId],@"user_id",_textView.text,@"content", nil];
    
//    [HHttpManager POST:Server_user_feedback parameters:dic success:^(id responseObject) {
//        NSDictionary *responseDic=(NSDictionary*)responseObject;
//        NSDictionary *infoMapDic=[responseDic objectForKey:@"infoMap"];
//        NSString *flagStr=[infoMapDic objectForKey:@"flag"];
//
//        if ([flagStr isEqualToString:@"1"]) {
//            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:nil message:@"恭喜你，提交成功!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"知道了", nil];
//            alertView.tag=2014;
//            [alertView show];
//        }else{
//            [MBProgressHUD showAlterWithMessage:[infoMapDic stringValueForKey:@"reason"]];
//
//        }
//    } failure:^(NSError *error) {
//        [MBProgressHUD showAlterWithMessage:@"网络异常，请稍后再试！"];
//
//    }];
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==2014) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
