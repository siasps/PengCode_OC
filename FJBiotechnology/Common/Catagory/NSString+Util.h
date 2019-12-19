//
//  NSString+Util.h
//  yitongxing
//
//  Created by 曹宇 on 2017/5/19.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Util)
/**
 *返回值是该字符串所占的大小(width, height)
 *font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *maxSize : 为限制改字体的最大宽和高(如果显示一行,则宽高都设置为MAXFLOAT, 如果显示为多行,只需将宽设置一个有限定长值,高设置为MAXFLOAT)
 */
-(CGSize)sk_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

//求有行间距的label高度
-(CGSize)sk_sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize linespace:(CGFloat)space;


/**
 *返回值是该字符串所占的大小(width, height)
 *font : 该字符串所用的字体(字体大小不一样,显示出来的面积也不同)
 *单行模式， 不限制最大区域
 */
-(CGSize)sk_sizeWithFont:(UIFont *)font;

-(BOOL) isEqualToCharQueue:(const char *)cs;

+(NSString *)stringFromBase32String:(NSString *)base32String;

-(NSString *)base32String;

/**
 *对比两个字符串内容是否一致
 */
- (BOOL) equals:(NSString*) string;
/**
 *判断字符串是否以指定的前缀开头
 */
- (BOOL) startsWith:(NSString*)prefix;


/**
 *判断字符串是否以指定的后缀结束
 */
- (BOOL) endsWith:(NSString*)suffix;


/**
 *转换成大写 
 */
- (NSString *) toLowerCase;


/**
 *转换成小写
 */
- (NSString *) toUpperCase;

/**
 *截取字符串前后空格
 */
- (NSString *) trim;

//用指定分隔符将字符串分割成数组
- (NSArray *) split:(NSString*) separator;

//用指定字符串替换原字符串
- (NSString *) replaceAll:(NSString*)oldStr with:(NSString*)newStr;

//从指定的开始位置和结束位置开始截取字符串
- (NSString *) substringFromIndex:(int)begin toIndex:(int)end;

//MD5加密小写
+ (NSString *)stringFromLowerCaseMD5:(NSString *)sourceString;
//MD5加密大写
+ (NSString *)stringFromUpperCaseMD5:(NSString *)sourceString;
//时间戳转换为几分钟,几天前
+ (NSString *)updateTimeFrom13TimestampToTime:(NSString *)createTimeString;
//时间戳转化为日期
+ (NSString *)updateTimeFrom13TimestampToDateString:(NSString *)createTimeString;
//纯数字转化为几千
+ (NSString *)changeCountToThousand:(NSString *)count;
//识别网址
+(NSString *)recognizeURLToOpen:(NSString *)string;
//判断字符串是否为NULL或null
+ (BOOL) isNULLString:(NSString *)string;
//判断是否全是空格
+(BOOL)isEmpty:(NSString *)str;
//判断是否手机号码有用
+ (BOOL)isPhoneNumber:(NSString *)mobile;
//获取当前时间
+(NSString*)getCurrentTimes;
//获取当前时间的时间戳
+(NSString*)getCurrentTimestamp;
//根据date获取星期
+(NSString *)getWeekFromDate:(NSDate *)date;
//比较两个时间
+ (int)compareOneDay:(NSDate *)oneDay withAnotherDay:(NSDate *)anotherDay;
//字典转json
+(NSString *)changeToJsonWithDictionary:(NSDictionary *)dict;
//获取国家编码
+ (NSString *)getCountryCode;

/** 生成32位随机字符串 */
+(NSString *)get32RandomString;
/** 获取deviceToken */
+ (NSString *)getDeviceTokenWithDeviceTokenData:(NSData *)deviceToken;

/** 获取当前手机语言 */
+(NSString *)getIPhoneCurrentLanguage;
//移除字符串中的空格和换行
+ (NSString *)removeSpaceAndNewline:(NSString *)str;

//获取手机类型
+ (NSString*)getiPhoneType;
//是否全是数字
+ (BOOL)isAllNumber:(NSString *)str;
//NSDate转换为几分钟,几天前
+ (NSString *)updateTimeDateToTime:(NSString *)createTimeString;
//获取后格式:1天2小时30分
+ (NSString *)getDateStringWithTimeInterval:(NSTimeInterval)interval;

//@字符串识别规则
+ (NSArray *)getRangeWithAtPattern:(NSString *)str;
//#话题#字符串识别规则
+ (NSArray *)getRangeWithTopicPattern:(NSString *)str;
//url字符串识别规则
+ (NSArray *)getRangeWithUrlPattern:(NSString *)str;

//显示价格
+ (NSString *)priceFloat:(float)f;
@end
