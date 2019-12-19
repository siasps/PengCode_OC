//
//  GVUserDefaults+Util.h
//  译同行
//
//  Created by 曹宇 on 2017/8/29.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "GVUserDefaults.h"

@interface GVUserDefaults (Util)

@property (nonatomic ,weak) NSArray *addressList;
@property (nonatomic ,weak) NSString *headImageUrl;
@property (nonatomic ,weak) NSString *mobile;
@property (nonatomic ,weak) NSString *nickName;
@property (nonatomic ,weak) NSString *sex;
@property (nonatomic ,weak) NSString *userId;

@property (nonatomic ,weak) NSString *UserNo;//本地记住账号
@property (nonatomic ,weak) NSString *UserPassword;//本地记住密码

@property (nonatomic ,weak) NSString *apikey; //请求参数
@property (nonatomic ,weak) NSString *apisecret;//请求参数

@end
