//
//  HHttpRequestHeader.h
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HHttpRequestHeader : NSObject
+(NSDictionary *)getHeader;
+ (NSString *)getAppID;
@end
