//
//  UserManager.m
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import "UserManager.h"
#import "AppDelegate.h"
//#import "JPushManager.h"


@implementation UserManager
//判断是否登录
+(BOOL)isLogin
{
    if ([GVUserDefaults standardUserDefaults].UserNo.length>0) {
        return YES;
    }else{
        return NO;
    }
}


+ (void)refrushNewData{
    
//    [HHttpManager POSTNoHUD:get_user parameters:nil success:^(id responseObject) {
//        [self saveUserInfo:responseObject];
//    } failure:^(NSError *error) {
//        [SVProgressHUD showErrorWithStatus:@"网络异常"];
//    }];
}

+ (void)saveUserInfo:(id)responseObject{
    
    NSDictionary *resultListDict = (NSDictionary *)responseObject;
    NSLog(@"%@", [NSString changeToJsonWithDictionary:responseObject]);
    
    GVUserDefaults *userDefaults = [GVUserDefaults standardUserDefaults];
    userDefaults.UserNo             = [resultListDict stringValueForKey:@"UserNo"];
    userDefaults.UserPassword       = [resultListDict stringValueForKey:@"UserPassword"];

    AppDelegate *delegate =  (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate setRootControllerWithLoginStatus];
    
//    [[JPushManager shareManager]bindJpushId];
//
//    [[NSNotificationCenter defaultCenter]postNotificationName:BYLoginSucceedNotification object:nil];
//
//    SK_MAIN_THREAD_START{
//
//        //[BYPLVVodSDK setCacheDir];
//
//    }SK_MAIN_THREAD_END
}



+ (void)logout{
    GVUserDefaults *userDefaults = [GVUserDefaults standardUserDefaults];
    userDefaults.headImageUrl = @"";
    userDefaults.mobile       = @"";
    userDefaults.nickName     = @"";
    userDefaults.sex          = @"";
    userDefaults.userId       = @"";
    userDefaults.UserNo       = @"";
    userDefaults.UserPassword = @"";
    userDefaults.apikey       = @"";
    userDefaults.apisecret    = @"";
    
    AppDelegate *delegate =  (AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate setRootControllerWithLoginStatus];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:BYLoginSucceedNotification object:nil];
    
    SK_MAIN_THREAD_START{
        //[BYPLVVodSDK setCacheDir];
        
        [HHttpManager removeAllHttpCache];
        //Noti_Post(UserLogout, nil);
    }SK_MAIN_THREAD_END
}

+ (NSString *)getUserId{
    NSString *userId = emptyString([GVUserDefaults standardUserDefaults].userId);
    return userId;
}


+ (NSString *)getMobileNumber{
    NSString *UserNo = emptyString([GVUserDefaults standardUserDefaults].UserNo);
    return UserNo;
}

+ (NSString *)getHeaderImageUrl{
    NSString *headImageUrl = emptyString([GVUserDefaults standardUserDefaults].headImageUrl);
    return headImageUrl;
}


//+ (NSString *)setPrefixURLWithURL:(NSString *)imageurl{
//    NSString *prefixStr = [GVUserDefaults standardUserDefaults].prefixURL;
//
//    NSString *url = [prefixStr stringByAppendingPathComponent:imageurl];
//
//    return url;
//}
//
//+ (NSString *)setPrefixAndSuffixURLWithURL:(NSString *)imageurl{
//    NSString *prefixStr = [GVUserDefaults standardUserDefaults].prefixURL;
//    NSString *suffixStr = [GVUserDefaults standardUserDefaults].thumbURL;
//    NSString *url = [[prefixStr stringByAppendingPathComponent:imageurl] stringByAppendingString:suffixStr];
//    return url;
//}


+ (NSString *)getApikey{
    NSString *apikey = emptyString([GVUserDefaults standardUserDefaults].apikey);
    return apikey;
}

+ (NSString *)getApisecret{
    NSString *apisecret = emptyString([GVUserDefaults standardUserDefaults].apisecret);
    return apisecret;
}




@end
