//
//  PPInterfacedConst.h
//  PPNetworkHelper
//
//  Created by AndyPang on 2017/4/10.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
 
 将项目中所有的接口写在这里,方便统一管理,降低耦合
 
 这里通过宏定义来切换你当前的服务器类型,
 将你要切换的服务器类型宏后面置为真(即>0即可),其余为假(置为0)
 如下:现在的状态为测试服务器
 这样做切换方便,不用来回每个网络请求修改请求域名,降低出错事件
 */

#define DevelopSever 1//开发环境
#define ProductSever 0//生产环境

UIKIT_EXTERN NSString *const kApiPrefix;/** 接口前缀-开发服务器*/

UIKIT_EXTERN NSString *const kToken;/** Touken前缀*/

UIKIT_EXTERN NSString *const iphone_md5_key;/** 加密密钥*/



#pragma mark - 登录/注册

//验证码 1注册 2找回密码 3登录
#define Server_verification         [NSString stringWithFormat:@"%@/captcha/send",kApiPrefix]

//注册
#define Server_register             [NSString stringWithFormat:@"%@/register.php",kApiPrefix]

//账号密码登录
#define Server_loginByPwd           [NSString stringWithFormat:@"%@/user/loginByPwd",kApiPrefix]

//短信登录
#define Server_loginByCaptcha       [NSString stringWithFormat:@"%@/user/loginByCaptcha",kApiPrefix]

//忘记密码
#define Server_findPwd              [NSString stringWithFormat:@"%@/user/findPwd",kApiPrefix]

#pragma mark - 公共 - token，配置等

//获取token
#define  Server_anthorizeTokenUrl    [NSString stringWithFormat:@"%@/auth/api/getToken",kToken]

//获取省市区
#define Server_serverOpened          [NSString stringWithFormat:@"%@/config/region/serverOpened",kApiPrefix]

//检查版本
#define Server_checkAppVersion       [NSString stringWithFormat:@"%@/config/checkAppVersion",kApiPrefix]


//图片上传
#define Server_upload_image          [NSString stringWithFormat:@"https://upload.bejiaoyu.cn/file/upload"]



#pragma mark - 首页

//app首页
#define Server_config_home_page      [NSString stringWithFormat:@"%@/config/homePage",kApiPrefix]




#pragma mark - 课程

//免费体验 课程列表
#define Server_course_free_list      [NSString stringWithFormat:@"%@/course/freeCourseList",kApiPrefix]

//精品推荐 课程列表
#define Server_course_recommend_list      [NSString stringWithFormat:@"%@/course/recommendedCourseList",kApiPrefix]

//课程列表
#define Server_course_list      [NSString stringWithFormat:@"%@/course/list",kApiPrefix]

//课程详情
#define Server_course_detail      [NSString stringWithFormat:@"%@/course/detail/",kApiPrefix]

//我的课程
#define Server_course_my_list      [NSString stringWithFormat:@"%@/course/my/",kApiPrefix]

//章节单词列表
#define Server_course_word_list      [NSString stringWithFormat:@"%@/course/wordList/",kApiPrefix]

//发表评论
#define Server_course_comment_add     [NSString stringWithFormat:@"%@/comment/add",kApiPrefix]

//教师资讯
#define Server_teacher_detail     [NSString stringWithFormat:@"%@/teacher/detail",kApiPrefix]



#pragma mark - 用户

//个人信息
#define Server_user_information      [NSString stringWithFormat:@"%@/personal/information",kApiPrefix]

//修改用户信息
#define Server_user_updateUserInfo   [NSString stringWithFormat:@"%@/personal/updateUserInfo",kApiPrefix]

//保存地址
#define Server_add_list              [NSString stringWithFormat:@"%@/address/list/",kApiPrefix]

//保存地址
#define Server_add_address           [NSString stringWithFormat:@"%@/address/add",kApiPrefix]

//删除地址
#define Server_delete_address        [NSString stringWithFormat:@"%@/address/delete",kApiPrefix]

//获取token
#define Server_update_address        [NSString stringWithFormat:@"%@/address/update",kApiPrefix]

//绑定认证id，用于app推送
#define Server_user_registrationid_bind        [NSString stringWithFormat:@"%@/user/registrationid/bind",kApiPrefix]



#pragma mark - 订单
//订单列表
#define Server_order_list            [NSString stringWithFormat:@"%@/order/list/",kApiPrefix]

//订单详情
#define Server_order_detail          [NSString stringWithFormat:@"%@/order/detail/",kApiPrefix]

//确认订单时，获取订单相关信息
#define Server_order_sure            [NSString stringWithFormat:@"%@/order/getOrderRelatedInfo",kApiPrefix]

//确认订单
#define Server_order_submit           [NSString stringWithFormat:@"%@/order/submit",kApiPrefix]

//获取支付参数
#define Server_order_payInfo           [NSString stringWithFormat:@"%@/order/payInfo",kApiPrefix]

//意见反馈
#define Server_user_feedback           [NSString stringWithFormat:@"%@/user/feedback",kApiPrefix]

//激活码兑换优惠券
#define Server_activate_code         [NSString stringWithFormat:@"%@/order/activate",kApiPrefix]

//激活码兑换优惠券
#define Server_user_isBuyCourse      [NSString stringWithFormat:@"%@/order/getUserIsBuyCourse",kApiPrefix]

#pragma mark - 优惠券

//领取优惠券
#define Server_receive_coupon        [NSString stringWithFormat:@"%@/coupon/receive",kApiPrefix]



#pragma mark - 设备绑定

//我的设备列表
#define Server_device_list           [NSString stringWithFormat:@"%@/device/list/",kApiPrefix]

//添加设备
#define Server_device_add            [NSString stringWithFormat:@"%@/device/add",kApiPrefix]

//解绑设备
#define Server_device_delete         [NSString stringWithFormat:@"%@/device/unbind",kApiPrefix]

#pragma mark - 收藏
//收藏&取消收藏
#define Server_collect               [NSString stringWithFormat:@"%@/collect",kApiPrefix]

//我的收藏
#define Server_collectList           [NSString stringWithFormat:@"%@/collectList/",kApiPrefix]

//保存分享课程记录
#define Server_saveShareCourseLog           [NSString stringWithFormat:@"%@/saveShareCourseLog/",kApiPrefix]



#pragma mark - 练习

//章节练习列表
#define Server_exercises_chapter_list  [NSString stringWithFormat:@"%@/exercises/list/",kApiPrefix]

//强化练习目录
#define Server_exercises_catalog_list        [NSString stringWithFormat:@"%@/exercises/catalog",kApiPrefix]

//练习结果提交
#define Server_exercises_commit        [NSString stringWithFormat:@"%@/exercises/commit",kApiPrefix]

//我的错题列表
#define Server_exercises_errorList       [NSString stringWithFormat:@"%@/exercises/errorList/",kApiPrefix]

//我的练习题目录
#define Server_exercises_my       [NSString stringWithFormat:@"%@/exercises/my/",kApiPrefix]





