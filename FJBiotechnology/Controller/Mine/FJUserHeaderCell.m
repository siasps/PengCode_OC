//
//  FJUserHeaderCell.m
//  FJBiotechnology
//
//  Created by peng on 2019/2/26.
//  Copyright © 2019 peng. All rights reserved.
//

#import "FJUserHeaderCell.h"

@implementation FJUserHeaderCell

-(void)initSubviews{
    
    
    _headerImage = [[UIImageView alloc] init];
    _headerImage.image = [UIImage imageNamed:@"user_header.png"];
    [self addSubview:_headerImage];
    [self.headerImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(30);
        make.left.mas_equalTo(SCREEN_WIDTH/2 -45);
        make.width.mas_equalTo(90);
        make.height.mas_equalTo(90);
    }];
    
    _nameLabel = [[UILabel alloc] init];
    _nameLabel.textColor = TextColor_1;
    _nameLabel.font = [UIFont systemFontOfSize:16];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    _nameLabel.text = [GVUserDefaults standardUserDefaults].UserNo;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.headerImage.mas_bottom).mas_offset(15);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(20);
        
    }];
}

@end



@implementation FJUserNormalCell

-(void)initSubviews{
    
    
    _icon_image = [[UIImageView alloc] init];
    _icon_image.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_icon_image];
    [self.icon_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(12);
        make.left.mas_equalTo(15);
        make.width.mas_equalTo(20);
        make.height.mas_equalTo(20);
    }];
    
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.textColor = TextColor_1;
    _contentLabel.font = [UIFont systemFontOfSize:14];
    _contentLabel.textAlignment = NSTextAlignmentLeft;
    _contentLabel.text = [GVUserDefaults standardUserDefaults].UserNo;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.icon_image.mas_right).mas_offset(15);
        make.top.mas_equalTo(7);
        make.width.mas_equalTo(SCREEN_WIDTH-150);
        make.height.mas_equalTo(30);
        
    }];
    
    
    _arrow_image = [[UIImageView alloc] init];
    _arrow_image.image = [UIImage imageNamed:@"user_arrow_icon.png"];
    _arrow_image.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_arrow_image];
    [self.arrow_image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(18);
        make.right.mas_equalTo(-16);
        make.width.mas_equalTo(7);
        make.height.mas_equalTo(12);
    }];
    
}

-(void)reloadWithInformation:(NSDictionary *)information imageIconString:(NSString *)imageStr titleString:(NSString*)titleStr{
    _icon_image.image = [UIImage imageNamed:imageStr];
    _contentLabel.text = titleStr;

}

@end
