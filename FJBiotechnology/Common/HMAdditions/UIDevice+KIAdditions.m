//
//  UIDevice+KIAdditions.m
//  HuaxiajiaboApp
//
//  Created by HuamoMac on 15/4/20.
//  Copyright (c) 2015年 HuaMo. All rights reserved.
//

#import "UIDevice+KIAdditions.h"
#import <sys/sysctl.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import "Reachability.h"
#include <sys/types.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <net/if_dl.h>
#include <ifaddrs.h>
#import "sys/utsname.h"
#import <arpa/inet.h>
#import <mach/mach.h>
#include <objc/runtime.h>


static NSString *memoryUUID = nil;


@implementation UIDevice (KIAdditions)

+ (NSString *) deviceType
{
    NSString *deviceType = [[NSUserDefaults standardUserDefaults] stringForKey:@"devicetype"];
    if(nil != deviceType && [deviceType length]>0)
        return deviceType;
    
    size_t size;
    sysctlbyname("hw.machine", NULL, &size, NULL, 0);
    char *machine = malloc(size);
    sysctlbyname("hw.machine", machine, &size, NULL, 0);
    deviceType = [NSString stringWithUTF8String:machine];
    free(machine);
    /*
     if ([platform isEqualToString:@"iPhone1,1"])    deviceType = @"iPhone 1G";
     else if ([platform isEqualToString:@"iPhone1,2"])    deviceType = @"iPhone 3G";
     else if ([platform isEqualToString:@"iPhone2,1"])    deviceType = @"iPhone 3GS";
     else if ([platform isEqualToString:@"iPhone3,1"])    deviceType = @"iPhone 4";
     else if ([platform isEqualToString:@"iPhone3,3"])    deviceType = @"iPhone 4 Verizon";
     else if ([platform isEqualToString:@"iPhone4,1"])    deviceType = @"iPhone 4S";
     else if ([platform isEqualToString:@"iPhone5,2"])    deviceType = @"iPhone 5";
     
     else if ([platform isEqualToString:@"iPod1,1"])      deviceType = @"iPod Touch 1G";
     else if ([platform isEqualToString:@"iPod2,1"])      deviceType = @"iPod Touch 2G";
     else if ([platform isEqualToString:@"iPod3,1"])      deviceType = @"iPod Touch 3G";
     else if ([platform isEqualToString:@"iPod4,1"])      deviceType = @"iPod Touch 4G";
     
     else if ([platform isEqualToString:@"iPad1,1"])      deviceType = @"iPad";
     else if ([platform isEqualToString:@"iPad2,1"])      deviceType = @"iPad 2 (WiFi)";
     else if ([platform isEqualToString:@"iPad2,2"])      deviceType = @"iPad 2 (GSM)";
     else if ([platform isEqualToString:@"iPad2,3"])      deviceType = @"iPad 2 (CDMA)";
     
     else if ([platform isEqualToString:@"i386"])         deviceType = @"Simulator";
     
     
     if (nil == deviceType)  deviceType = platform;
     if (nil == deviceType)  deviceType = @"";
     if (nil != deviceType) */
    [[NSUserDefaults standardUserDefaults] setValue:deviceType forKey:@"devicetype"];
    
    return deviceType;
}

+ (NSString *)getDeviceName
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7";//国行、日版、港行
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"Phone 7 Plus";//港行、国行i
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7";//美版、台版
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";//美版、台版
    if ([deviceString isEqualToString:@"iPhone10,1"])   return @"iPhone 8";//国行(A1863)、日行(A1906)
    if ([deviceString isEqualToString:@"iPhone10,4"])   return @"iPhone 8";//美版(Global/A1905)
    if ([deviceString isEqualToString:@"iPhone10,2"])   return @"iPhone 8 Plus";//国行(A1864)、日行(A1898)
    if ([deviceString isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";//美版(Global/A1897)
    if ([deviceString isEqualToString:@"iPhone10,3"])   return @"iPhone X";//国行(A1865)、日行(A1902)
    if ([deviceString isEqualToString:@"iPhone10,6"])   return @"iPhone X";//美版(Global/A1901)
    
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,11"])    return @"iPad 5 (WiFi)";
    if ([deviceString isEqualToString:@"iPad6,12"])    return @"iPad 5 (Cellular)";
    if ([deviceString isEqualToString:@"iPad7,1"])     return @"iPad Pro 12.9 inch 2nd gen (WiFi)";
    if ([deviceString isEqualToString:@"iPad7,2"])     return @"iPad Pro 12.9 inch 2nd gen (Cellular)";
    if ([deviceString isEqualToString:@"iPad7,3"])     return @"iPad Pro 10.5 inch (WiFi)";
    if ([deviceString isEqualToString:@"iPad7,4"])     return @"iPad Pro 10.5 inch (Cellular)";
    
    if ([deviceString isEqualToString:@"AppleTV2,1"])    return @"Apple TV 2";
    if ([deviceString isEqualToString:@"AppleTV3,1"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV3,2"])    return @"Apple TV 3";
    if ([deviceString isEqualToString:@"AppleTV5,3"])    return @"Apple TV 4";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    return deviceString;
}

+ (NSString *)getNetType{
    NSString *netType = @"G";
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    if (netStatus == ReachableViaWiFi) {
        netType = @"WIFI";
    }else {
        NSString *version = [[UIDevice currentDevice] systemVersion];
        CGFloat versionNum = [version floatValue];
        if (versionNum>4.0) {
            CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
            CTCarrier *carrier = [netinfo subscriberCellularProvider];
            NSString *netName;
            netName = [carrier carrierName];
            if ([netName isEqualToString:@"中国联通"]) {
                netType = @"CU";
            }else if([netName isEqualToString:@"中国移动"]){
                netType = @"CM";
            }else if([netName isEqualToString:@"中国电信"]){
                netType = @"CT";
            }else {
                netType = @"G";
            }
        }
    }
    
    return netType;
}


char*  getMacAddress(char* macAddress, char* ifName) {
    
    int  success;
    struct ifaddrs * addrs;
    struct ifaddrs * cursor;
    const struct sockaddr_dl * dlAddr;
    const unsigned char* base;
    int i;
    
    success = getifaddrs(&addrs) == 0;
    if (success) {
        cursor = addrs;
        while (cursor != 0) {
            if ( (cursor->ifa_addr->sa_family == AF_LINK)
                && (((const struct sockaddr_dl *) cursor->ifa_addr)->sdl_type == 0x6) && strcmp(ifName,  cursor->ifa_name)==0 ) {
                dlAddr = (const struct sockaddr_dl *) cursor->ifa_addr;
                base = (const unsigned char*) &dlAddr->sdl_data[dlAddr->sdl_nlen];
                strcpy(macAddress, "");
                for (i = 0; i < dlAddr->sdl_alen; i++) {
                    if (i != 0) {
                        strcat(macAddress, ":");
                    }
                    char partialAddr[3];
                    sprintf(partialAddr, "%02X", base[i]);
                    strcat(macAddress, partialAddr);
                    
                }
            }
            cursor = cursor->ifa_next;
        }
        
        freeifaddrs(addrs);
    }
    return macAddress;
}

+(NSString *)getMacAddress
{
    char* macAddressString= (char*)malloc(18);
    NSString* macAddress= [[NSString alloc] initWithCString:getMacAddress(macAddressString,"en0")
                                                   encoding:NSMacOSRomanStringEncoding];
    free(macAddressString);
    return macAddress;
}

#pragma mark Public Methods
- (NSString *) uniqueDeviceIdentifier{
    @synchronized(self){
        if (memoryUUID == nil || [memoryUUID isEqualToString: @""]) {
            NSString *defaultUUID = [[NSUserDefaults standardUserDefaults] stringForKey: HM_UUID_KEY];
            if (defaultUUID == nil || [defaultUUID isEqualToString:@""]) {
                float systemVersion = [[[UIDevice currentDevice] systemVersion] floatValue];
                UIPasteboard *board;
                //ios 7.0 用系统剪贴板
                if (systemVersion > 6.99) {
                    board = [UIPasteboard generalPasteboard];
                }
                else {
                    board = [UIPasteboard pasteboardWithName:HM_UUID_KEY create: YES];
                }
                
                NSString *pasteboardUUID = [[NSString alloc] initWithData: [board dataForPasteboardType: HM_UUID_KEY] encoding:NSUTF8StringEncoding];
                if (pasteboardUUID == nil || [pasteboardUUID isEqualToString:@""]) {
                    NSString *keyChainUUID = [SFHFKeychainUtils getPasswordForUsername:HM_UUID_KEY andServiceName:HM_SERVER_NAME error:nil];
                    //NIF_TRACE(@"+++++++++++++++++++++deviceid:%@",keyChainUUID);
                    if (keyChainUUID == nil || [keyChainUUID isEqualToString:@""]){
                        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
                        //keyChainUUID = [NSString stringWithFormat:@"HJB-%@",(NSString *)CFUUIDCreateString (kCFAllocatorDefault,uuidRef)];
                        keyChainUUID = [NSString stringWithFormat:@"HJB-%@",(NSString *)CFBridgingRelease(CFUUIDCreateString (kCFAllocatorDefault,uuidRef))];
                        [SFHFKeychainUtils storeUsername:HM_UUID_KEY andPassword:keyChainUUID forServiceName:HM_SERVER_NAME updateExisting:YES error:nil];
                        //    [SFHFKeychainUtils deleteItemForUsername:DDCOUPON_UUID_KEY andServiceName:DDCOUPON_SERVER_NAME error:nil];//remove uuid from keychain
                    }
                    [board setData: [keyChainUUID dataUsingEncoding: NSUTF8StringEncoding] forPasteboardType: HM_UUID_KEY];
                    
                    [[NSUserDefaults standardUserDefaults] setObject:keyChainUUID forKey:HM_UUID_KEY];
                    [[NSUserDefaults standardUserDefaults] synchronize];
                    
                    
                    memoryUUID = [[NSString alloc]initWithString:keyChainUUID];
                    return keyChainUUID;
                }
                
                [[NSUserDefaults standardUserDefaults] setObject:pasteboardUUID forKey:HM_UUID_KEY];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                memoryUUID = pasteboardUUID;
                return pasteboardUUID;
            }
            memoryUUID = defaultUUID ;
            return defaultUUID;
        }
        return memoryUUID;
    }
}


#pragma mark - 获取设备信息

//获取电池电量(一般用百分数表示,大家自行处理就好)
-(CGFloat)getBatteryQuantity
{
    return [[UIDevice currentDevice] batteryLevel];
}

//获取电池状态(UIDeviceBatteryState为枚举类型)
-(UIDeviceBatteryState)getBatteryStauts
{
    return [UIDevice currentDevice].batteryState;
}

//获取总内存大小
+ (long long)getTotalMemorySize
{
    return [NSProcessInfo processInfo].physicalMemory /1024/1024;
}

//获取当前可用内存
+ (long long)getAvailableMemorySize
{
    vm_statistics_data_t vmStats;
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    if (kernReturn != KERN_SUCCESS)
    {
        return NSNotFound;
    }
    return ((vm_page_size * vmStats.free_count + vm_page_size * vmStats.inactive_count)) /1024/1024;
}


//获取已使用内存
+ (long long)getUsedMemorySize
{
    task_basic_info_data_t taskInfo;
    mach_msg_type_number_t infoCount = TASK_BASIC_INFO_COUNT;
    kern_return_t kernReturn = task_info(mach_task_self(),
                                         TASK_BASIC_INFO,
                                         (task_info_t)&taskInfo,
                                         &infoCount);
    
    if (kernReturn != KERN_SUCCESS
        ) {
        return NSNotFound;
    }
    
    return taskInfo.resident_size /1024/1024;
}





@end
