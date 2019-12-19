//
//  GVUserDefaults+Util.m
//  译同行
//
//  Created by 曹宇 on 2017/8/29.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "GVUserDefaults+Util.h"

@implementation GVUserDefaults (Util)

@dynamic addressList;
@dynamic headImageUrl;
@dynamic mobile;
@dynamic nickName;
@dynamic sex;
@dynamic userId;

@dynamic UserNo;
@dynamic UserPassword;
@dynamic apikey;
@dynamic apisecret;

- (NSDictionary *)setupDefaults {
    return @{
             @"headImageUrl" : @"",
             @"mobile" : @"",
             @"realName" : @"",
             @"sex" : @"",
             @"userId" : @""
             };
}

- (NSString *)transformKey:(NSString *)key {
    key = [key stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[key substringToIndex:1] uppercaseString]];
    return [NSString stringWithFormat:@"NSUserDefault%@", key];
}
@end
