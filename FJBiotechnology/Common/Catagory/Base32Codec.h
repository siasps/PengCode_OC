//
//  Base32Codec.h
//  yitongxing
//
//  Created by 曹宇 on 2017/5/19.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Base32Codec : NSObject
+(NSData *)dataFromBase32String:(NSString *)base32String;
+(NSString *)base32StringFromData:(NSData *)data;
+(NSString *)base32StringFromDataNoPadding:(NSData *)data;

@end
