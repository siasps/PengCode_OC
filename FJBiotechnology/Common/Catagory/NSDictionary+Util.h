//
//  NSDictionary+Util.h
//  译同行
//
//  Created by 曹宇 on 2017/6/5.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Util)
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
- (NSString *)stringValueForKey:(id)key;
- (id)valueObjectForKey:(id)aKey;
- (BOOL)boolValueForKey:(id)key;

- (int)intValueForKey:(id)key;

- (NSInteger)integerValueForKey:(id)key;

- (float)floatValueForKey:(id)key;

- (double)doubleValueForKey:(id)key;
@end
