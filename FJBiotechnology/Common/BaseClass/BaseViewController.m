//
//  BaseViewController.m
//  Astrologie
//
//  Created by 曹宇 on 2018/3/26.
//  Copyright © 2018年 peng. All rights reserved.
//

#import "BaseViewController.h"
#import "NavigationView.h"

#define EmptyViewTag  53333
#define NoNetWorkViewTag  53334

@interface BaseViewController ()
@property (nonatomic, strong)BaseButton *bottomButton;
@property (nonatomic, strong)UIButton *backButton;
@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1.0];
    
    
    [self setNavbarParam];
    
}

- (void)setNavbarParam{
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (self.navigationController.viewControllers.count>1) {
        //[self showCustomBackButton];
    }
    
    self.navigationController.navigationBar.translucent = YES;
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = YES;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
}

- (void)setNaviTitle:(NSString *)naviTitle{
    [self setNaviTitle:naviTitle textColor:RGB_COLOR_String(@"#1D1D27")];//灰黑
}

- (void)setNaviTitle:(NSString *)naviTitle textColor:(UIColor *)textColor{
    _naviTitle = naviTitle;
    UILabel *titleLabel = (UILabel *)self.navigationItem.titleView;
    if (!titleLabel) {
        titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        [titleLabel setTextAlignment:NSTextAlignmentCenter];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [titleLabel setFont:[UIFont systemFontOfSize:18]];
        [self.navigationItem setTitleView:titleLabel];
        
        //注意：防止rightBarButtonItem为nil，title被挤到右屏幕边缘显示
        if (!self.navigationItem.rightBarButtonItem) {
            UIView *fixedSpaceView = [[UIView alloc]init];
            fixedSpaceView.frame = CGRectMake(0, 7, 20, 50);
            UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:fixedSpaceView];
            self.navigationItem.rightBarButtonItem = backItem;
        }
    }
    [titleLabel setTextColor:textColor];
    //[titleLabel setTextColor:[UIColor whiteColor]];//白色
    [titleLabel setText:naviTitle];
    [titleLabel sizeToFit];
}

- (void)setTitleView{
    UIImageView *titleImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo_title.png"]];
    titleImage.clipsToBounds = YES;
    titleImage.frame = CGRectMake(0, 0, 88, 18);
    
    self.navigationItem.titleView = titleImage;
    
}

- (void)showCustomBackButton{
    [self showCustomBackButton:@selector(close)];
}

- (void)showCustomWhiteBackButton{
    [self setNavLeftItem:@selector(close) image:[UIImage imageNamed:@"backButton_white.png"] imageH:[UIImage imageNamed:@"backButton_white.png"]];

}

- (void)showCustomBackButton:(SEL)selector {
    [self setNavLeftItem:selector image:[UIImage imageNamed:@"backButton"] imageH:[UIImage imageNamed:@"backButton"]];
    
}

- (void)setNavigationViewTitle:(NSString *)navigationViewTitle{
    _navigationViewTitle = navigationViewTitle;
    self.navigationView = [[NavigationView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, NaviViewHeight)];
    self.navigationView.titleLabel.text = navigationViewTitle;
    [self.view addSubview:self.navigationView];
    [self.navigationView.tapToReturn addTarget:self action:@selector(handleLeftBackButtonReturn)];
    [self.navigationView.tapToReturn2 addTarget:self action:@selector(handleLeftBackButtonReturn) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationView.rightButton addTarget:self action:@selector(handleRightButtonClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationView.isHideReturnButton = NO;

}

#pragma mark - nav bar 设置
- (void)setNavLeftItem:(SEL)selector image:(UIImage *)image imageH:(UIImage *)imageH {

    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:imageH forState:UIControlStateHighlighted];
    [backButton setFrame:CGRectMake(0, 0, 30, NaviViewHeight)];
    backButton.backgroundColor = [UIColor clearColor];
//    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
}

- (void)setNavRightItem:(SEL)selector image:(UIImage *)image imageH:(UIImage *)imageH {
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setImage:image forState:UIControlStateNormal];
    [backButton setImage:imageH forState:UIControlStateHighlighted];
    [backButton setFrame:CGRectMake(0, 7, 24, 24)];
    backButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.rightBarButtonItem = backItem;
}
-(void)setNavRightItem:(SEL)selector title:(NSString *)title color:(UIColor *)color
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:title forState:UIControlStateNormal];
    [backButton setTitle:title forState:UIControlStateHighlighted];
    [backButton setTitleColor:color forState:UIControlStateNormal];
    [backButton setFrame:CGRectMake(0, 7, 70, 30)];
    backButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [backButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [backButton addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.rightBarButtonItem = backItem;
}

//自建的navigationView返回
- (void)handleLeftBackButtonReturn{
    [self popViewControllerAnimated:YES];
}

- (void)handleRightButtonClick{
    
}


- (void)setBottomButtonTitle:(NSString *)bottomButtonTitle{
    _bottomButtonTitle = bottomButtonTitle;
    self.bottomButton = [BaseButton button];
    self.bottomButton.title = bottomButtonTitle;
    self.bottomButton.titleFont = [UIFont systemFontOfSize:17];
    self.bottomButton.titleColor = [UIColor whiteColor];
    self.bottomButton.backgroundColor = Default_Color;
    self.bottomButton.frame = CGRectMake(0, SCREEN_HEIGHT-50-HHBottomMargin, SCREEN_WIDTH, 50);
    [self.bottomButton addTarget:self action:@selector(handleBottomButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.bottomButton];
}

- (void)handleBottomButtonClick{
    
}

//navigation返回
- (void)close{
    [self popViewControllerAnimated:YES];
}


- (void)showHalfAlphaBlackView{
    _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _backButton.frame = CGRectMake(0, NaviViewHeight, SCREEN_WIDTH, SCREEN_HEIGHT);
    _backButton.backgroundColor = [UIColor blackColor];
    _backButton.alpha = 0.5;
    [self.view addSubview:_backButton];
}

- (void)hideHalfAlphaBlackView{
    [_backButton removeFromSuperview];
    _backButton = nil;
}

@end





@implementation UIViewController (HM)


#pragma mark - empty view

- (void)showEmptyView{
    [self showEmptyViewWithMessage:@"暂无相关内容，换个词试试吧"];
}

- (void)showEmptyViewWithMessage:(NSString *)message{
    [self showEmptyViewWithMessage:message inView:self.view];
}

- (void)showEmptyViewWithMessage:(NSString *)message inView:(UIView *)inView{
    UIView *emptyView= (UIView *)[inView viewWithTag:EmptyViewTag];
    if (!emptyView) {
        emptyView = [[UIView alloc]init];
        emptyView.backgroundColor = [UIColor clearColor];
        emptyView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        emptyView.tag = EmptyViewTag;
        
        UIImageView *emptyImage = [[UIImageView alloc]init];
        emptyImage.frame = CGRectMake((SCREEN_WIDTH-71.5)/2.0f, (SCREEN_HEIGHT-SCREEN_TOP_HEIGHT-SCREEN_BOTTOM_HEIGHT-100)/2.0f, 71.5, 101.5);
        emptyImage.image = [UIImage imageNamed:@"icon_empty_view.png"];
        [emptyView addSubview:emptyImage];
        
        UILabel *emptyLabel = [[UILabel alloc] init];
        emptyLabel.frame = CGRectMake(40, 0, SCREEN_WIDTH-80, 20);
        emptyLabel.backgroundColor = [UIColor clearColor];
        emptyLabel.textColor = TextColor_3;
        emptyLabel.textAlignment = NSTextAlignmentCenter;
        emptyLabel.font = [UIFont systemFontOfSize:13];
        emptyLabel.text = message;
        [emptyView addSubview:emptyLabel];
        [emptyLabel underView:emptyImage padding:8];
        [emptyLabel verticalAllignment:emptyImage];
        
    }
    
    
    //emptyView.center = CGPointMake(inView.width/2.0, inView.height/2.0);
    [inView addSubview:emptyView];
    [inView sendSubviewToBack:emptyView];
    
    
}

- (void)hideEmptyView{
    [self hideEmptyViewInView:self.view];
}
- (void)hideEmptyViewInView:(UIView *)view{
    
    UIView *emptyView= (UIView *)[view viewWithTag:EmptyViewTag];
    
    emptyView.hidden = YES;
    [emptyView removeFromSuperview];
}


#pragma mark - 网络异常时调用此方法

//- (BOOL)canShowNotNetView{
//
//}
//
//- (void)refrushWithNotNet{
//
//
//}





@end
