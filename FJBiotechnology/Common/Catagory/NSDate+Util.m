//
//  NSDate+Util.m
//  fanxingxue
//
//  Created by 曹宇 on 2018/4/9.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import "NSDate+Util.h"

@implementation NSDate (Util)

+ (NSString*)getStringFromDate:(NSDate*)date dateFormatter:(NSString*)formatterString{
    
    if (formatterString==nil || (![formatterString isKindOfClass:[NSString class]])) {
        return nil;
    }
    
    if (date==nil || (![date isKindOfClass:[NSDate class]])) {
        return nil;
    }
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:formatterString];
    NSString *returnString = [formatter2 stringFromDate:date];
    
    return returnString;
}

//str转date
+ (NSDate*)getDateFromString:(NSString*)string dateFormatter:(NSString*)formatterString{
    
    if (formatterString==nil || (![formatterString isKindOfClass:[NSString class]])) {
        return nil;
    }
    
    if (string==nil || (![string isKindOfClass:[NSString class]])) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatterString];
    NSDate *oldDate = [formatter dateFromString:string];
    
    
    return oldDate;
}

//是否在某个日期之前
- (BOOL)isBefore:(NSDate *)date {
    NSTimeInterval selfTimeInterval = [self timeIntervalSince1970];
    NSTimeInterval dateTimeInterval = [date timeIntervalSince1970];
    if (selfTimeInterval < dateTimeInterval) {
        return YES;
    }
    return NO;
}
//是否在某个日期之后
- (BOOL)isAfter:(NSDate *)date {
    NSTimeInterval selfTimeInterval = [self timeIntervalSince1970];
    NSTimeInterval dateTimeInterval = [date timeIntervalSince1970];
    if (selfTimeInterval > dateTimeInterval) {
        return YES;
    }
    return NO;
}

+ (NSString *)timeStringWithDateString:(NSString *)dateString{
    NSDate *date =  [NSDate getDateFromString:dateString dateFormatter:KKDateFormatter01];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[date timeIntervalSince1970]];
   return [NSDate timeStringWithTimeInterval:timeSp];
}

//时间戳转换为 微博形式 时间
+ (NSString *)timeStringWithTimeInterval:(NSString *)timeInterval
{
    
    NSDate *date;
    if (timeInterval.length == 13) {
         date= [NSDate dateWithTimeIntervalSince1970:timeInterval.longLongValue/1000]; //此处根据项目需求,选择是否除以1000 , 如果时间戳精确到秒则去掉1000
    }else{
         date= [NSDate dateWithTimeIntervalSince1970:timeInterval.longLongValue]; //此处根据项目需求,选择是否除以1000 , 如果时间戳精确到秒则去掉1000
    }
   
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    
    //今天
    if ([date isToday]) {
        NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
        NSTimeInterval createTime = [timeInterval longLongValue];
        // 时间差
        NSTimeInterval time = currentTime - createTime;
        
        NSInteger sec = time/60;
        
        //秒转分钟
        if (sec<=3 ) {
            return @"刚刚";
        }else if (sec<60 && sec>3 ) {
            return [NSString stringWithFormat:@"%ld分钟前",(long)sec];
        }else{
        formatter.dateFormat = @"HH:mm";
        return [formatter stringFromDate:date];
        }
    }else{
        if ([date isYesterday]) {//昨天
            
            formatter.dateFormat = @"昨天 HH:mm";
            return [formatter stringFromDate:date];
            
            
        }
//        else if ([date isSameWeek]){//这周
//
//            formatter.dateFormat = [NSString stringWithFormat:@"%@ %@",[date weekdayStringFromDate],@"HH:mm"];
//            return [formatter stringFromDate:date];
//
//          
//        }
        else if ([date isThisYear]){//今年
            
        formatter.dateFormat = @"MM-dd HH:mm";
        
        return [formatter stringFromDate:date];
            
        
        }else{//直接显示年月日
            
            formatter.dateFormat = @"yy-MM-dd";
            return [formatter stringFromDate:date];
        }
    }
    return nil;
}


//是否在同一周
- (BOOL)isSameWeek
{
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitWeekday | NSCalendarUnitMonth | NSCalendarUnitYear ;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}


//根据日期求星期几
- (NSString *)weekdayStringFromDate{
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:self];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}




//是否为今天
- (BOOL)isToday
{
    //now: 2015-09-05 11:23:00
    //self 调用这个方法的对象本身
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear ;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}



//是否为昨天
- (BOOL)isYesterday
{
    //2014-05-01
    NSDate *nowDate = [[NSDate date] dateWithYMD];
    
    //2014-04-30
    NSDate *selfDate = [self dateWithYMD];
    
    //获得nowDate和selfDate的差距
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *cmps = [calendar components:NSCalendarUnitDay fromDate:selfDate toDate:nowDate options:0];
    
    return cmps.day == 1;
}

- (BOOL)isThisYear

{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    int unit = NSCalendarUnitYear;
    // 1.获得当前时间的年月日
    
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    // 2.获得self的年月日
    
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return nowCmps.year == selfCmps.year;
    
}

//格式化
- (NSDate *)dateWithYMD
{
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    fmt.dateFormat = @"yyyy-MM-dd";
    NSString *selfStr = [fmt stringFromDate:self];
    return [fmt dateFromString:selfStr];
}




@end
