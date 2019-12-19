//
//  NSDate+Util.h
//  fanxingxue
//
//  Created by 曹宇 on 2018/4/9.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

#define KKDateFormatter01 @"yyyy-MM-dd HH:mm:ss"
#define KKDateFormatter02 @"yyyy-MM-dd HH:mm"
#define KKDateFormatter03 @"yyyy-MM-dd HH"
#define KKDateFormatter04 @"yyyy-MM-dd"
#define KKDateFormatter05 @"yyyy-MM"
#define KKDateFormatter06 @"MM-dd"
#define KKDateFormatter07 @"HH:mm"
#define KKDateFormatter08 @"MM-dd HH:mm"

@interface NSDate (Util)

+ (NSString*)getStringFromDate:(NSDate*)date dateFormatter:(NSString*)formatterString;
+ (NSDate*)getDateFromString:(NSString*)string dateFormatter:(NSString*)formatterString;

- (BOOL)isBefore:(NSDate *)date;
- (BOOL)isAfter:(NSDate *)date;


//时间戳转换为 微博形式 时间   (类型:今天,昨天,本周,今年,年月日都显示)
+ (NSString *)timeStringWithTimeInterval:(NSString *)timeInterval;
//字符串日期换为 微博形式 时间   (类型:今天,昨天,本周,今年,年月日都显示)
+ (NSString *)timeStringWithDateString:(NSString *)dateString;
@end
