//
//  CategoryManager.m
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/30.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import "CategoryManager.h"
@interface CategoryManager ()

@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSString *appCacheFilePath;

@end
@implementation CategoryManager
static CategoryManager *shareCategoryManager = nil;

+ (CategoryManager *)shareCategoryManager{
    if (!shareCategoryManager) {
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            shareCategoryManager = [[CategoryManager alloc]init];
            
            //先读取本地的缓存数据
            NSArray *allConfig = [CategoryManager getAllConfigData];
            if (allConfig.count > 0) {
                [shareCategoryManager dealDataWithAll:allConfig];//添加不限选项
            }
        });
    }
    return shareCategoryManager;
}

- (NSString *)appCacheFilePath{
    if (!_appCacheFilePath || _appCacheFilePath.length<=0) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        _appCacheFilePath = [paths objectAtIndex:0];
    }
    return _appCacheFilePath;
}

#pragma mark - 初始化数据

//刷新类别数据
- (void)refrushCategoryData{
//    [HHttpManager POSTNoHUD:check_config parameters:nil success:^(id responseObject) {
////        NSLog(@"%@", [NSString changeToJsonWithDictionary:responseObject]);
//         [self handleResultList:responseObject];
//    } failure:^(NSError *error) {
//        
//    }];
}


- (void)handleResultList:(id)responseObject{
    NSArray *resultList = [responseObject objectForKey:@"resultList"];
        if (resultList.count > 0) {
            [self dealDataWithAll:resultList];//添加不限选项
            SK_BG_THREAD_START{
                [CategoryManager saveAllConfigData:resultList];
            }SK_BG_THREAD_END
        }
}

#pragma mark - 类别数据沙盒存取

+ (void)saveAllConfigData:(NSArray *)array{
    
    if (!array || array.count<=0) {
        return;
    }
    
    NSString *cacheDirectory = [shareCategoryManager appCacheFilePath];
    NSString *tempPath = [cacheDirectory stringByAppendingPathComponent:ALLConfigPath];
    NSString *tempDataPath = [cacheDirectory stringByAppendingPathComponent:ALLConfigData];;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if(![fileManager contentsOfDirectoryAtPath:tempPath error:nil]){
        [fileManager createDirectoryAtPath:tempPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    
    NSError* error = nil;
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:array
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    [jsonData writeToFile:tempDataPath atomically:YES];
    
    
}



+ (NSArray *)getAllConfigData{
    NSString *cacheDirectory = [shareCategoryManager appCacheFilePath];
    NSString *tempDataPath = [cacheDirectory stringByAppendingPathComponent:ALLConfigData];
    
    NSData *jsonData = [NSData dataWithContentsOfFile:tempDataPath];
    if (!jsonData) {
        return nil;
    }
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    
    if (![array isKindOfClass:[NSArray class]]) {
        return nil;
    }
    
    return array;
}

//每个类别添加不限选项
- (void)dealDataWithAll:(NSArray *)array{
    _dataArray = [[NSMutableArray alloc]init];
    
    [_dataArray addObject:array];
    
}

#pragma mark - 首饰分类
- (NSArray *)getJewelryClassifyCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *classifyArray = [allDict objectForKey:@"category"];
    if (classifyArray == nil) {
        return [NSArray array];
    }
    return classifyArray;
}
#pragma mark - 首饰材质
- (NSArray *)getJewelryMaterialCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *classifyArray = [allDict objectForKey:@"material"];
    if (classifyArray == nil) {
        return [NSArray array];
    }
    return classifyArray;
}
#pragma mark - 首饰颜色
- (NSArray *)getJewelryColorCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *colorArray = [allDict objectForKey:@"colors"];
    if (colorArray == nil) {
        return [NSArray array];
    }
    return colorArray;
    
}

#pragma mark - 品牌名称
- (NSArray *)getJewelryBrandCatagoryData
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *colorArray = [allDict objectForKey:@"brand"];
    if (colorArray == nil) {
        return [NSArray array];
    }
    return colorArray;
    
}
#pragma mark - 收入配置
- (NSArray *)getIncomesCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *colorArray = [allDict objectForKey:@"incomes"];
    return colorArray;
    
}
#pragma mark - 职业配置
- (NSArray *)getJobsCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *colorArray = [allDict objectForKey:@"jobs"];
    return colorArray;
}

#pragma mark - 场景配置
- (NSArray *)getSceneCatagoryData
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *colorArray = [allDict objectForKey:@"scene"];
    return colorArray;
}

#pragma mark - 产品价格区间配置
- (NSArray *)getPriceCatagoryData
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *colorArray = [allDict objectForKey:@"price"];
    return colorArray;
}

#pragma mark - 星级配置
- (NSArray *)getStarCatagoryData
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *colorArray = [allDict objectForKey:@"star"];
    return colorArray;
}

#pragma mark - 会员种类配置
- (NSArray *)getMember_typeCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSArray *colorArray = [allDict objectForKey:@"member_type"];
    return colorArray;
}

#pragma mark - Alipay回调配置
- (NSString *)getAlipay_notifyCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSString *alipay_notify = [allDict objectForKey:@"alipay_notify"];
    return alipay_notify;
}
#pragma mark - wxpay回调配置
- (NSString *)getWxpay_notifyCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSString *wxpay_notify = [allDict objectForKey:@"wxpay_notify"];
    return wxpay_notify;
}

-(NSDictionary *)getBox_saleCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSDictionary *box_sale = [allDict objectForKey:@"box_sale"];
    return box_sale;
}


#pragma mark - 获取所需数据

/**
 获取所有类别数据
 */
- (NSArray *)getCatagoryData{
    
    if (!_dataArray || _dataArray.count<=0) {
        [[CategoryManager shareCategoryManager]refrushCategoryData];
        return nil;
    }
    
    return _dataArray;
}

/**
 公司信息
 */
- (NSDictionary *)getContact_usCatagoryData;
{
    NSArray *allArray = [_dataArray firstObject];
    NSDictionary *allDict = [allArray firstObject];
    NSDictionary *contact_us = [allDict objectForKey:@"contact_us"];
    if (contact_us == nil || contact_us.count == 0) {
        return [NSDictionary dictionary];
    }
    return contact_us;
}

@end
