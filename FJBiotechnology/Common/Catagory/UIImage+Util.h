//
//  UIImage+Util.h
//  yitongxing
//
//  Created by 曹宇 on 2017/5/19.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Util)
//从view截图或者图片
+(UIImage *)getImageFromView:(UIView *)orgView inRect:(CGRect)rect;
//将两张image叠层合成为一个
+ (UIImage *)addImage:(UIImage *)image1 withImage:(UIImage *)image2;
//图片拼接
+ (UIImage *) combineTopImage:(UIImage*)topImage BottomImage:(UIImage*)bottomImage;
//图片自定size
+ (UIImage *)reBigSizeImage:(UIImage *)image toSize:(CGSize)reSize;
+ (UIImage *)reSmallSizeImage:(UIImage *)image toSize:(CGSize)reSize;
//压缩图片到指定大小(kb)
+ (NSData *)zipOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

typedef void (^GIFimageBlock)(UIImage *GIFImage);
/** 根据本地GIF图片名 获得GIF image对象 */

+ (UIImage *)imageWithGIFNamed:(NSString *)name;

/** 根据一个GIF图片的data数据 获得GIF image对象 */

+ (UIImage *)imageWithGIFData:(NSData *)data;

/** 根据一个GIF图片的URL 获得GIF image对象 */

+ (void)imageWithGIFUrl:(NSString *)url and:(GIFimageBlock)gifImageBlock;




@end
