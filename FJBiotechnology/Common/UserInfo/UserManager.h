//
//  UserManager.h
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserManager : NSObject
+(BOOL)isLogin;
+ (void)refrushNewData;
+ (NSString *)getUserId;
+ (NSString *)getMobileNumber;
+ (NSString *)getHeaderImageUrl;

//+ (NSString *)setPrefixURLWithURL:(NSString *)imageurl;
//+ (NSString *)setPrefixAndSuffixURLWithURL:(NSString *)imageurl;


+ (NSString *)getApikey;
+ (NSString *)getApisecret;

+ (void)saveUserInfo:(id)responseObject;
+ (void)logout;
@end
