//
//  FJAboutMeCustomCell.m
//  FJBiotechnology
//
//  Created by peng on 2019/2/27.
//  Copyright © 2019 peng. All rights reserved.
//

#import "FJAboutMeCustomCell.h"

@implementation FJAboutMeCustomCell

- (void)initSubviews{
    
    self.backgroundView.backgroundColor = [UIColor clearColor];
    self.backgroundColor = [UIColor clearColor];
    
    self.label = [[UILabel alloc] init];
    self.label.font = [UIFont systemFontOfSize:16];
    self.label.textColor = RGB_COLOR_String(@"#6F6F6F");
    self.label.numberOfLines = 0;
    self.label.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:self.label];
//    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(20);
//        make.left.mas_equalTo(20);
//        make.right.mas_equalTo(-20);
//        make.height.mas_equalTo(200);
//    }];
    
    
}

-(void)reloadWithInformation:(NSDictionary *)information{
    
    NSString *string = @"菲伽生物生智能备孕产品服务生，基于生物监测技术，从医疗级的硬件——孕＋智能备孕仪作切入，配合自主开发的孕＋app，无论是怀孕测试还是排卵测试，都能够获取专业的检测报告，在怀孕几率指导上能够精确到小时。\n\n客服邮箱：Global-cs@future-plus.com.cn \nQQ交流群：817615207";
    self.label.text = string;
    UIFont*font=[UIFont systemFontOfSize:16];
    CGRect bounds=[string boundingRectWithSize:CGSizeMake(SCREEN_WIDTH -30, 10000) options: NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(15);
        make.left.mas_equalTo(15);
        make.right.mas_equalTo(-15);
        make.height.mas_equalTo(bounds.size.height);
    }];
    
    
    
}

+(CGFloat)getCellHeight:(NSDictionary *)information{
    
     NSString *string = @"菲伽生物生智能备孕产品服务生，基于生物监测技术，从医疗级的硬件——孕＋智能备孕仪作切入，配合自主开发的孕＋app，无论是怀孕测试还是排卵测试，都能够获取专业的检测报告，在怀孕几率指导上能够精确到小时。\n\n客服邮箱：Global-cs@future-plus.com.cn \nQQ交流群：817615207";
    
    UIFont*font=[UIFont systemFontOfSize:16];
    CGRect bounds=[string boundingRectWithSize:CGSizeMake(SCREEN_WIDTH -30, 10000) options: NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    
    return bounds.size.height +30;
}

@end
