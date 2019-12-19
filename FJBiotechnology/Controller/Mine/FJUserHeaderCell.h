//
//  FJUserHeaderCell.h
//  FJBiotechnology
//
//  Created by peng on 2019/2/26.
//  Copyright © 2019 peng. All rights reserved.
//

#import "BaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface FJUserHeaderCell : BaseTableViewCell

@property (nonatomic ,strong) UIImageView *headerImage;
@property (nonatomic ,strong) UILabel *nameLabel;

@end

NS_ASSUME_NONNULL_END



@interface FJUserNormalCell : BaseTableViewCell

@property (nonatomic ,strong) UIImageView *icon_image;
@property (nonatomic ,strong) UILabel     *contentLabel;
@property (nonatomic ,strong) UIImageView *arrow_image;

-(void)reloadWithInformation:(NSDictionary *)information imageIconString:(NSString *)imageStr titleString:(NSString*)titleStr;

@end
