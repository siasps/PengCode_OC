//
//  NSDictionary+Util.m
//  译同行
//
//  Created by 曹宇 on 2017/6/5.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "NSDictionary+Util.h"

@implementation NSDictionary (Util)

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


- (BOOL)boolValueForKey:(id)key {
    return [[self objectForKey:key] boolValue];
}

- (int)intValueForKey:(id)key {
    return [[self objectForKey:key] intValue];
}

- (NSInteger)integerValueForKey:(id)key {
    return [[self objectForKey:key] integerValue];
}

- (float)floatValueForKey:(id)key {
    return [[self objectForKey:key] floatValue];
}

- (double)doubleValueForKey:(id)key {
    return [[self objectForKey:key] doubleValue];
}

- (NSString *)stringValueForKey:(id)key {
    if (!self || !key) {
        return @"";
    }
    
    id value = [self objectForKey:key];
    if (value == [NSNull null] || value == nil) {
        value = @"";
    }
    if (![value isKindOfClass:[NSString class]]) {
        value = [[NSString alloc] initWithFormat:@"%@", value];
    }
    return value;
}

- (id)valueObjectForKey:(id)aKey{
    if (!self || [self isKindOfClass:[NSNull class]] || !aKey) {
        return nil;
    }
    
    if ([[self objectForKey:aKey] isKindOfClass:[NSNumber class]]) {
        
        return [[self objectForKey:aKey] stringValue];
    }else if ([[self objectForKey:aKey] isKindOfClass:[NSNull class]] || ![self objectForKey:aKey]){
        return nil;
    }
    
    return [self objectForKey:aKey];
}
@end
