//
//  HHttpRequestHeader.m
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/28.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import "HHttpRequestHeader.h"
#import <net/if.h>
#import <sys/sysctl.h>
#import <net/if_dl.h>
@implementation HHttpRequestHeader
+(NSDictionary *)getHeader
{
    
    NSString *appName    = @"Astrologie";
    NSString *appVersion = FXX_AppVersion;
    NSString *appid      = [self getAppID];
    NSString *channel    = @"App Store";
    NSString *deviceType = @"iphone";
    NSString *macAddress =  [self macaddress];
    NSString *netType    = [self getNetType];
    NSString *primaryKey = DEVICE_ID;
    NSString *sys        = @"I";
    NSString *version    = FXX_AppVersion;
    NSString *uuid = [[[UIDevice currentDevice] identifierForVendor] UUIDString];

    
    
    NSMutableDictionary*dic=[NSMutableDictionary dictionaryWithObjectsAndKeys:
                             appName,@"appName",
                             appVersion,@"appVersion",
                             channel,@"channel",
                             macAddress,@"macAddress",
                             netType,@"netType",
                             primaryKey,@"primaryKey",
                             @"zh-CN", @"Accept-Language",
                             appid, @"APPID",
                             sys,@"sys",
                             netType,@"nettype",
                             version,@"version",
                             deviceType,@"deviceType",
                             uuid,@"deviceNumber",nil];
    //NIF_TRACE(@"%@",dic);
    return dic;
    
}



+ (NSString *)getAppID
{
    
    //    NSString *appId = [[NSUserDefaults standardUserDefaults] stringForKey:@"APPID"];
    //    if(appId != nil || [appId length]>0)
    //        return appId;
    
    UIDevice *device = [UIDevice currentDevice];
    NSString *appIDStr = @"";
    
    NSArray *lines = [device.systemVersion componentsSeparatedByString:@"."];
    
    NSString *firstNum;
    NSString *secondNum;
    
    if ([lines count] == 2) {
        if ([[lines objectAtIndex:0] intValue] < 10) {
            firstNum = [NSString stringWithFormat:@"0%@", [lines objectAtIndex:0]];
        } else {
            firstNum = [lines objectAtIndex:0];
        }
        
        secondNum = [NSString stringWithFormat:@"%@0",[lines objectAtIndex:1]];
        
        
    } else if ([lines count] == 3) {
        if ([[lines objectAtIndex:0] intValue] < 10) {
            firstNum = [NSString stringWithFormat:@"0%@", [lines objectAtIndex:0]];
        } else {
            firstNum = [lines objectAtIndex:0];
        }
        
        secondNum = [NSString stringWithFormat:@"%@%@", [lines objectAtIndex:1], [lines objectAtIndex:2]];
    } else {
        firstNum = @"00";
        secondNum = @"00";
    }
    appIDStr = [NSString stringWithFormat:@"I%@%@%@%@%@", firstNum, secondNum,CURRENT_APP_TYPE,CURRENT_APP_VERSION,DISTRIBUTION_CHANNAL];
    [[NSUserDefaults standardUserDefaults] setValue:appIDStr forKey:@"APPID"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    return appIDStr;
    
}

+ (NSString *) macaddress
{
    
    int                 mib[6];
    size_t              len;
    char                *buf;
    unsigned char       *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl  *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    NSString *outstring = [NSString stringWithFormat:@"%02x:%02x:%02x:%02x:%02x:%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];

//    NSLog(@"outString:%@", outstring);
    
    free(buf);
    
    return [outstring uppercaseString];
}

+ (NSString *)getNetType{
    NSString *netType = @"G";
//    Reachability *reachability = [Reachability reachabilityForInternetConnection];
//    NetworkStatus netStatus = [reachability currentReachabilityStatus];
//    if (netStatus == ReachableViaWiFi) {
        netType = @"WIFI";
//    }else {
//        NSString *version = [[UIDevice currentDevice] systemVersion];
//        CGFloat versionNum = [version floatValue];
//        if (versionNum>4.0) {
//            CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
//            CTCarrier *carrier = [netinfo subscriberCellularProvider];
//            NSString *netName;
//            netName = [carrier carrierName];
//            if ([netName isEqualToString:@"中国联通"]) {
//                netType = @"CU";
//            }else if([netName isEqualToString:@"中国移动"]){
//                netType = @"CM";
//            }else if([netName isEqualToString:@"中国电信"]){
//                netType = @"CT";
//            }else {
//                netType = @"G";
//            }
//        }
//    }
    
    return netType;
}




@end
