//
//  HHttpManager.m
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import "HHttpManager.h"
#import "PPNetworkHelper.h"
#import "HHttpRequestHeader.h"
#import "AFHTTPSessionManager.h"
//#import "HMAuthorizeToken.h"

@implementation HHttpManager

+(void)configHeader{
    
    [PPNetworkHelper setRequestSerializer:PPRequestSerializerHTTP];
    [PPNetworkHelper setRequestTimeoutInterval:10];
//    [PPNetworkHelper setAFHTTPSessionManagerProperty:^(AFHTTPSessionManager *sessionManager) {
//        sessionManager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
//        sessionManager.securityPolicy.allowInvalidCertificates = YES;
//        [sessionManager.securityPolicy setValidatesDomainName:NO];
//    }];
    
    
    //请求头加token
//    NSString *authoToken = [[HMAuthorizeToken shareAuthorizeToken]authoToken];
//    [PPNetworkHelper setValue:authoToken forHTTPHeaderField:@"access_token"];

    
    //userId
    if ([UserManager isLogin]) {
        NSString *userId = [GVUserDefaults standardUserDefaults].userId;
        [PPNetworkHelper setValue:userId forHTTPHeaderField:@"userid"];
        [PPNetworkHelper setValue:userId forHTTPHeaderField:@"userId"];
        
    }else{
//        [PPNetworkHelper setValue:@"0" forHTTPHeaderField:@"userid"];//未登录传0
//        [PPNetworkHelper setValue:@"0" forHTTPHeaderField:@"userId"];//未登录传0
    }
    
    NSString *jpushId = [[NSUserDefaults standardUserDefaults] stringForKey:@"registrationID"];
    [PPNetworkHelper setValue:[NSString stringWithFormat:@"%@", jpushId] forHTTPHeaderField:@"registrationid"];
    
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
    [PPNetworkHelper setValue:uuid forHTTPHeaderField:@"deviceNumber"];

    
    //orther
    NSDictionary *headerDict = [HHttpRequestHeader getHeader];
    for(NSString *k in [headerDict allKeys])
    {
        [PPNetworkHelper setValue:[headerDict objectForKey:k] forHTTPHeaderField:k];
    }

}


//GET请求
+(void)GET:(NSString *)urlString success:(HttpSuccess)success failure:(HttpFailure)failure{
    [self GET:urlString parameters:nil success:success failure:failure];
}

+(void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters
   success:(HttpSuccess)success failure:(HttpFailure)failure{
    
    [self configHeader];
    //头文件添加授权token
//    NSString *authoToken = [[HMAuthorizeToken shareAuthorizeToken]authoToken];
//    if (authoToken && authoToken.length>0) {
//        [PPNetworkHelper setValue:authoToken forHTTPHeaderField:@"access_token"];
//    }else{
//        [HMAuthorizeToken refrushTokenWithUrl:urlString parameters:parameters requestType:HMRequestType_get success:success failure:failure];
//        return;
//    }
    
    [SVProgressHUD showWithStatus:@"加载中"];
    [PPNetworkHelper GET:urlString parameters:parameters success:^(id responseObject) {
        
        [SVProgressHUD dismiss];

        NSDictionary *infoMap = [responseObject objectForKey:@"infoMap"];
        //NSString *flag = [infoMap stringValueForKey:@"flag"];
        //NSString *reason = [infoMap stringValueForKey:@"reason"];
        NSInteger need_refresh_token = [[infoMap stringValueForKey:@"need_refresh_token"] integerValue];
        
        if(need_refresh_token == 1) {
            
//            [HMAuthorizeToken refrushTokenWithUrl:urlString parameters:parameters requestType:HMRequestType_get success:success failure:failure];
//            return;
        }
        
        NSString *isLatestLoginDevice = [infoMap stringValueForKey:@"isLatestLoginDevice"];
        if ([isLatestLoginDevice isEqualToString:@"-1"]) {
            
           
            
//            QuitLoginView *view = [QuitLoginView shareQuitLoginView];
//            [view show];
//            [UserManager logout];
//
//            return;
            
        }
        
        
        NSLog(@"URL:%@\n%@", urlString, responseObject);
        success(responseObject);
        
        
    } failure:^(NSError *error) {
        failure(error);
        
        [SVProgressHUD dismiss];
    }];
}

+(void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters
      cache:(HttpCache)cache
   success:(HttpSuccess)success failure:(HttpFailure)failure{
    
    [PPNetworkHelper GET:urlString parameters:parameters responseCache:^(id responseCache) {
        cache(responseCache);
    } success:^(id responseObject) {
         success(responseObject);
    } failure:^(NSError *error) {
       failure(error);
    }];
}

//POST请求
+(void)POST:(NSString *)urlString parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure{
    [SVProgressHUD show];
    [self configHeader];
    
//    NSString *authoToken = [[HMAuthorizeToken shareAuthorizeToken]authoToken];
//    if (authoToken && authoToken.length>0) {
//        [PPNetworkHelper setValue:authoToken forHTTPHeaderField:@"access_token"];
//    }else{
//        [HMAuthorizeToken refrushTokenWithUrl:urlString parameters:parameters requestType:HMRequestType_post success:success failure:failure];
//        return;
//    }
    [PPNetworkHelper POST:urlString parameters:parameters success:^(id responseObject) {
        
        [SVProgressHUD dismiss];

        NSDictionary *infoMap = [responseObject objectForKey:@"infoMap"];
        NSInteger need_refresh_token = [[infoMap stringValueForKey:@"need_refresh_token"] integerValue];
        
        if(need_refresh_token == 1) {
            
//            [HMAuthorizeToken refrushTokenWithUrl:urlString parameters:parameters requestType:HMRequestType_post success:success failure:failure];
//            return;
        }
        
        
        NSString *isLatestLoginDevice = [infoMap stringValueForKey:@"isLatestLoginDevice"];
        if ([isLatestLoginDevice isEqualToString:@"-1"]) {
            
            
            
//            QuitLoginView *view = [QuitLoginView shareQuitLoginView];
//            [view show];
//            [UserManager logout];
//            return;
            
        }
        
        
        NSLog(@"URL:%@\n%@", urlString, responseObject);
        success(responseObject);
        
    } failure:^(NSError *error) {
        if (error.code == 3840) {
            [SVProgressHUD showErrorWithStatus:@"服务器异常"];
        }else if (error.code == -1001) {
            [SVProgressHUD showErrorWithStatus:@"请求超时"];
        }else{
             [SVProgressHUD showErrorWithStatus:@"网络异常"];
        }
        failure(error);
    }];
}

+(void)POSTNoHUD:(NSString *)urlString parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure{
    [self configHeader];
    
//    NSString *authoToken = [[HMAuthorizeToken shareAuthorizeToken]authoToken];
//    if (authoToken && authoToken.length>0) {
//        [PPNetworkHelper setValue:authoToken forHTTPHeaderField:@"access_token"];
//    }else{
//        [HMAuthorizeToken refrushTokenWithUrl:urlString parameters:parameters requestType:HMRequestType_post success:success failure:failure];
//        return;
//    }
    [PPNetworkHelper POST:urlString parameters:parameters success:^(id responseObject) {
        NSDictionary *infoMap = [responseObject objectForKey:@"infoMap"];
        
        NSString *flag = [infoMap stringValueForKey:@"flag"];
        NSString *reason = [infoMap stringValueForKey:@"reason"];
        NSInteger need_refresh_token = [[infoMap stringValueForKey:@"need_refresh_token"] integerValue];
        
        if ([flag isEqualToString:@"1"]) {
            success(responseObject);
        }else{
            if(need_refresh_token == 1) {
                
//                [HMAuthorizeToken refrushTokenWithUrl:urlString parameters:parameters requestType:HMRequestType_post success:success failure:failure];
//                return;
            }
            [SVProgressHUD showInfoWithStatus:reason];
            
        }
    } failure:^(NSError *error) {
        if (error.code == 3840) {
            [SVProgressHUD showErrorWithStatus:@"服务器异常"];
        }else if (error.code == -1001) {
            [SVProgressHUD showErrorWithStatus:@"请求超时"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"网络异常"];
        }
        failure(error);
    }];
}

+(void)POSTCache:(NSString *)urlString parameters:(NSDictionary *)parameters
    cache:(HttpCache)cache
    success:(HttpSuccess)success failure:(HttpFailure)failure{
    [self configHeader];
//    NSString *authoToken = [[HMAuthorizeToken shareAuthorizeToken]authoToken];
//    if (authoToken && authoToken.length>0) {
//        [PPNetworkHelper setValue:authoToken forHTTPHeaderField:@"access_token"];
//    }else{
//        [HMAuthorizeToken refrushTokenWithUrl:urlString parameters:parameters requestType:HMRequestType_post success:success failure:failure];
//        return;
//    }
    [PPNetworkHelper POST:urlString parameters:parameters responseCache:^(id responseCache) {
        NSDictionary *infoMap = [responseCache objectForKey:@"infoMap"];
        NSString *flag = [infoMap stringValueForKey:@"flag"];
        if ([flag isEqualToString:@"1"]) {
        cache(responseCache);
        }
    } success:^(id responseObject) {
        NSDictionary *infoMap = [responseObject objectForKey:@"infoMap"];
        NSString *flag = [infoMap stringValueForKey:@"flag"];
        NSString *reason = [infoMap stringValueForKey:@"reason"];
        NSInteger need_refresh_token = [[infoMap stringValueForKey:@"need_refresh_token"] integerValue];

        if ([flag isEqualToString:@"1"]) {
            success(responseObject);
        }else{
            if(need_refresh_token == 1) {
                
//                [HMAuthorizeToken refrushTokenWithUrl:urlString parameters:parameters requestType:HMRequestType_post success:success failure:failure];
//                return;
            }
            [SVProgressHUD showInfoWithStatus:reason];
            
        }
    } failure:^(NSError *error) {
        if (error.code == 3840) {
            [SVProgressHUD showErrorWithStatus:@"服务器异常"];
        }else if (error.code == -1001) {
            [SVProgressHUD showErrorWithStatus:@"请求超时"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"网络异常"];
        }
        failure(error);
    }];
}



// 上传图片
+ (void)UPLOAD:(NSString *)urlString parameters:(id)parameters UploadImage:(NSArray <UIImage *>*)imageArray progressValue:(HttpProgress)progressValue success:(HttpSuccess)success failure:(HttpFailure)failure{
    [SVProgressHUD show];
    [self configHeader];
    
    [PPNetworkHelper uploadImagesWithURL:urlString parameters:parameters name:@"file" images:imageArray fileNames:nil imageScale:0.5 imageType:@"png" progress:^(NSProgress *progress) {
//        NSLog(@"上传进度:%.2f%%",100.0 * progress.completedUnitCount/progress.totalUnitCount);
        progressValue(100.0 * progress.completedUnitCount/progress.totalUnitCount);
    } success:^(id responseObject) {
//        NSLog(@"%@", responseObject);
        NSDictionary *infoMap = [responseObject objectForKey:@"infoMap"];
        NSString *flag = [infoMap stringValueForKey:@"flag"];
        NSString *reason = [infoMap stringValueForKey:@"reason"];
        if ([flag isEqualToString:@"1"]) {
            [SVProgressHUD dismiss];
            success(responseObject);
        }else{
            [SVProgressHUD showInfoWithStatus:reason];
        }
    } failure:^(NSError *error) {
        if (error.code == 3840) {
            [SVProgressHUD showErrorWithStatus:@"服务器异常"];
        }else if (error.code == -1001) {
            [SVProgressHUD showErrorWithStatus:@"请求超时"];
        }else{
            [SVProgressHUD showErrorWithStatus:@"网络异常"];
        }
        failure(error);
    }];

}

// 网络监测
+ (void)networkStatusWiFi:(StatusWiFi)statusWiFi
                  Status2G_3G_4G:(Status2G_3G_4G)status2G_3G_4G
                 StatusNoNetwork:(StatusNoNetwork)statusNoNetwork
                   StatusUnknown:(StatusUnknown)statusUnknown{
    [PPNetworkHelper networkStatusWithBlock:^(PPNetworkStatusType status) {
        switch (status) {
            case PPNetworkStatusUnknown://未知网络
                if (statusUnknown) {
                    statusUnknown(@"未知网络");
                }
                break;
            case PPNetworkStatusNotReachable://无网络
                if (statusNoNetwork) {
                    statusNoNetwork(@"无网络连接");
                }
                break;
            case PPNetworkStatusReachableViaWWAN://手机网络
                if (status2G_3G_4G) {
                    status2G_3G_4G(@"手机流量");
                }
                break;
            case PPNetworkStatusReachableViaWiFi://WIFI
                if (statusWiFi) {
                    statusWiFi(@"wifi");
                }
                break;

            default:
                break;
        }
    }];

}

//清除json缓存
+ (void)removeAllHttpCache{
    [PPNetworkCache removeAllHttpCache];
}


@end
