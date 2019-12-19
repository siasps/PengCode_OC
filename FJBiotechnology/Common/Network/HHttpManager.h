//
//  HHttpManager.h
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface HHttpManager : NSObject
//成功block 回调成功后得到的信息
typedef void (^HttpSuccess)(id responseObject);
//缓存回调
typedef void (^HttpCache)(id responseObject);
//失败block 回调失败信息
typedef void (^HttpFailure)(NSError *error);
//状态block 回调网络状态字符串
typedef void (^StatusUnknown)(NSString *state);
typedef void (^StatusNoNetwork)(NSString *state);
typedef void (^StatusWiFi)(NSString *state);
typedef void (^Status2G_3G_4G)(NSString *state);
//进度block 回调网络下载/上传进度
typedef void (^HttpProgress)(CGFloat progressValue);
//成功block 回调成功后得到的信息
typedef void (^DownloadSuccess)(NSURL *filePath);
//失败block 回调失败信息
typedef void (^DownloadFailure)(NSError *error);

+(void)configHeader;

//GET请求
+(void)GET:(NSString *)urlString success:(HttpSuccess)success failure:(HttpFailure)failure;
+(void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters
   success:(HttpSuccess)success failure:(HttpFailure)failure;
+(void)GET:(NSString *)urlString parameters:(NSDictionary *)parameters
     cache:(HttpCache)cache
   success:(HttpSuccess)success failure:(HttpFailure)failure;

//POST请求
+(void)POST:(NSString *)urlString parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure;
+(void)POSTNoHUD:(NSString *)urlString parameters:(NSDictionary *)parameters success:(HttpSuccess)success failure:(HttpFailure)failure;
+(void)POSTCache:(NSString *)urlString parameters:(NSDictionary *)parameters
           cache:(HttpCache)cache
         success:(HttpSuccess)success failure:(HttpFailure)failure;
////上传图片
+ (void)UPLOAD:(NSString *)urlString parameters:(id)parameters UploadImage:(NSArray <UIImage *>*)imageArray progressValue:(HttpProgress)progressValue success:(HttpSuccess)success failure:(HttpFailure)failure;
//网络监测;
+ (void)networkStatusWiFi:(StatusWiFi)statusWiFi
           Status2G_3G_4G:(Status2G_3G_4G)status2G_3G_4G
          StatusNoNetwork:(StatusNoNetwork)statusNoNetwork
            StatusUnknown:(StatusUnknown)statusUnknown;
//清除json缓存
+ (void)removeAllHttpCache;
@end
