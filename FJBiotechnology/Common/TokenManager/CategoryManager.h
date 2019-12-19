//
//  CategoryManager.h
//  fanxingxue
//
//  Created by 曹宇 on 2018/3/30.
//  Copyright © 2018年 caoyu. All rights reserved.
//

#import <Foundation/Foundation.h>
//类别缓存
#define ALLConfigPath     @"all_config"
#define ALLConfigData     @"all_config/all_config_data"

@interface CategoryManager : NSObject

+ (CategoryManager *)shareCategoryManager;

/**
 刷新类别数据
 */
- (void)refrushCategoryData;


/**
 获取所有类别数据
 */
- (NSArray *)getCatagoryData;

/**
 获取首饰分类
 */
- (NSArray *)getJewelryClassifyCatagoryData;

/**
 获取材质分类
 */
- (NSArray *)getJewelryMaterialCatagoryData;

/**
 获取首饰颜色
 */
- (NSArray *)getJewelryColorCatagoryData;

/**
 获取品牌名称
 */
- (NSArray *)getJewelryBrandCatagoryData;

/**
 获取收入配置数据
 */
- (NSArray *)getIncomesCatagoryData;

/**
 获取职业配置数据
 */
- (NSArray *)getJobsCatagoryData;
/**
 产品价格区间配置
 */
- (NSArray *)getPriceCatagoryData;
/**
 场景配置
 */
- (NSArray *)getSceneCatagoryData;
/**
 星级配置
 */
- (NSArray *)getStarCatagoryData;
/**
 获取会员种类配置
 */
- (NSArray *)getMember_typeCatagoryData;

/**
 获取Alipay支付回调
 */
- (NSString *)getAlipay_notifyCatagoryData;

/**
 获取Wxpay支付回调
 */
- (NSString *)getWxpay_notifyCatagoryData;

/**
 获取购买盒子商品折扣
 */
-(NSDictionary *)getBox_saleCatagoryData;

/**
 公司信息
 */
- (NSDictionary *)getContact_usCatagoryData;
@end
