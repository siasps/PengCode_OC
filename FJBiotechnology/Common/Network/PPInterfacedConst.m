//
//  PPInterfacedConst.m
//  PPNetworkHelper
//
//  Created by YiAi on 2017/7/6.
//  Copyright © 2017年 AndyPang. All rights reserved.
//

#import "PPInterfacedConst.h"

#if DevelopSever
/** 接口前缀-开发服务器*/
NSString *const kApiPrefix     = @"http://www.future-plus.com.cn/api";
NSString *const kToken         = @"";
NSString *const iphone_md5_key = @"";

#elif ProductSever
/** 接口前缀-生产服务器*/
NSString *const kApiPrefix     = @"";
NSString *const kToken         = @"";
NSString *const iphone_md5_key = @"";

#endif



