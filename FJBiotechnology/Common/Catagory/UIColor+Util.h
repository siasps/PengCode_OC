//
//  UIColor+Util.h
//  译同行
//
//  Created by 曹宇 on 2017/7/21.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import <UIKit/UIKit.h>


#define BLACK_COLOR_BASE     ff000000
#define DARKGRAY_COLOR_BASE  ff000000
#define LIGHTGRAY_COLOR_BASE ffaaaaaa
#define WHITE_COLOR_BASE     ffffffff
#define GRAY_COLOR_BASE      ff7f7f7f
#define RED_COLOR_BASE       ffff0000
#define GREEN_COLOR_BASE     ff00ff00
#define BLUE_COLOR_BASE      ff0000ff
#define CYAN_COLOR_BASE      ff00ffff
#define YELLOW_COLOR_BASE    ff00ffff
#define MAGENTA_COLOR_BASE   ffff00ff
#define ORANGE_COLOR_BASE    ffff7f00
#define PURPLE_COLOR_BASE    ff7f007f
#define BROWN_COLOR_BASE     ff996633
#define CLEAR_COLOR_BASE     00000000

#define SK_INT_COLOR_CAT(prefix,color) prefix ##color
#define SK_INT_COLOR(color_base) SK_INT_COLOR_CAT(0x, color_base)

#define BLACK_COLOR_INT     SK_INT_COLOR(BLACK_COLOR_BASE)
#define DARKGRAY_COLOR_INT  SK_INT_COLOR(DARKGRAY_COLOR_BASE)
#define LIGHTGRAY_COLOR_INT SK_INT_COLOR(LIGHTGRAY_COLOR_BASE)
#define WHITE_COLOR_INT     SK_INT_COLOR(WHITE_COLOR_BASE)
#define GRAY_COLOR_INT      SK_INT_COLOR(GRAY_COLOR_BASE)
#define RED_COLOR_INT       SK_INT_COLOR(RED_COLOR_BASE)
#define GREEN_COLOR_INT     SK_INT_COLOR(GREEN_COLOR_BASE)
#define BLUE_COLOR_INT      SK_INT_COLOR(BLUE_COLOR_BASE)
#define CYAN_COLOR_INT      SK_INT_COLOR(CYAN_COLOR_BASE)
#define YELLOW_COLOR_INT    SK_INT_COLOR(YELLOW_COLOR_BASE)
#define MAGENTA_COLOR_INT   SK_INT_COLOR(MAGENTA_COLOR_BASE)
#define ORANGE_COLOR_INT    SK_INT_COLOR(ORANGE_COLOR_BASE)
#define PURPLE_COLOR_INT    SK_INT_COLOR(PURPLE_COLOR_BASE)
#define BROWN_COLOR_INT     SK_INT_COLOR(BROWN_COLOR_BASE)
#define CLEAR_COLOR_INT     SK_INT_COLOR(CLEAR_COLOR_BASE)

typedef uint32_t color_t;
typedef uint8_t  ecolor_t;
typedef CGFloat  fcolor_t;
typedef ecolor_t* dcolor_t;

typedef UIColor* UIColorRef;
typedef NSNumber* NSNumberRef;
typedef NSArray* NSArrayRef;
typedef NSDictionary* NSDictionaryRef;

void SKCGContextSetFillColor(CGContextRef c, color_t color);
void SKCGContextSetStrokeColor(CGContextRef c, color_t color);

#define SKCGContextSetColor(gc, color)\
{\
SKCGContextSetFillColor(gc, color);\
SKCGContextSetStrokeColor(gc, color);\
}

@interface UIColor (Util)

@property (nonatomic, assign, readonly) fcolor_t red;
@property (nonatomic, assign, readonly) fcolor_t green;
@property (nonatomic, assign, readonly) fcolor_t blue;
@property (nonatomic, assign, readonly) fcolor_t alpha;

@property (nonatomic, assign, readonly) ecolor_t intRed;
@property (nonatomic, assign, readonly) ecolor_t intGreen;
@property (nonatomic, assign, readonly) ecolor_t intBlue;
@property (nonatomic, assign, readonly) ecolor_t intAlpha;

+(instancetype) colorWithAlpha:(fcolor_t)alpha red:(fcolor_t)red green:(fcolor_t)green blue:(fcolor_t)blue;

+(instancetype) colorWithIntRed:(ecolor_t)red green:(ecolor_t)green blue:(ecolor_t)blue alpha:(ecolor_t)alpha;
+(instancetype) colorWithIntAlpha:(ecolor_t)alpha red:(ecolor_t)red green:(ecolor_t)green blue:(ecolor_t)blue;

+(instancetype) colorWithIntRed:(ecolor_t)red green:(ecolor_t)green blue:(ecolor_t)blue floatAlpha:(CGFloat)alpha;
+(instancetype) colorWithFloatAlpha:(CGFloat)alpha red:(ecolor_t)red green:(ecolor_t)green blue:(ecolor_t)blue;

+(instancetype) colorWithInt:(color_t)color;
+(instancetype) colorWithString:(NSString*)color;

+(instancetype) colorWithInt:(color_t)color floatAlpha:(CGFloat)alpha;
+(instancetype) colorWithString:(NSString*)color floatAlpha:(CGFloat)alpha;

+(instancetype) randomColor;
+(instancetype) randomColorWithAlpha;

+(NSString*) intToString:(color_t)intValue;
+(color_t) stringToInt:(NSString*)stringValue;

-(color_t) intValue;
-(NSString*) stringValue;


//RGB:#F5F5F5
+ (UIColor *) colorWithHexString: (NSString *) hexString ;
@end
