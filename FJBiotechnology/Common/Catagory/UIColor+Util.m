//
//  UIColor+Util.m
//  译同行
//
//  Created by 曹宇 on 2017/7/21.
//  Copyright © 2017年 caoyu. All rights reserved.
//

#import "UIColor+Util.h"
#define SK_COLOR_MAX 255.0

#define SK_FLOAT_COLOR(hex) ((CGFloat) (hex / SK_COLOR_MAX))

#define SK_FLOAT_TO_COLOR(value) (((uint8_t)(((int32_t)floor(value * SK_COLOR_MAX)) & 0x000000ff)))

#define SK_STR_COLOR_LEN 9

#define SK_COLOR_DATA(color) ((dcolor_t)(&color));

static uint8_t hexCharToInt(char c) {
    uint8_t res = 0;
    if (c >= '0' && c <= '9') {
        res = c - '0';
    } else if (c >= 'a' && c <= 'f') {
        res = c - 'a' + 10;
    } else if (c >= 'A' && c <= 'F') {
        res = c - 'A' + 10;
    }
    return res;
}

static char intToHexChar(uint8_t value) {
    char res = '0';
    if (value >= 0 && value <= 9) {
        res = value + '0';
    } else if (value >= 10 && value <= 15) {
        res = value - 10 + 'a';
    }
    return res;
}

static color_t floatRgbaToInt(fcolor_t red, fcolor_t green, fcolor_t blue, fcolor_t alpha) {
    color_t res = 0;
    ecolor_t* resRaw = (uint8_t*) &res;
    resRaw[3] = SK_FLOAT_TO_COLOR(alpha);
    resRaw[2] = SK_FLOAT_TO_COLOR(red);
    resRaw[1] = SK_FLOAT_TO_COLOR(green);
    resRaw[0] = SK_FLOAT_TO_COLOR(blue);
    return res;
}

static ecolor_t hexcharsToBit(char first, char second) {
    return (hexCharToInt(second) & 0x0f) + ((hexCharToInt(first) << 4) & 0xf0);
}

static void bitToHexChars(ecolor_t value, char* res) {
    res[0] = intToHexChar((value & 0xf0) >> 4);
    res[1] = intToHexChar(value & 0x0f);
}

void SKCGContextSetFillColor(CGContextRef c, color_t color) {
    dcolor_t resRaw = SK_COLOR_DATA(color);
    CGContextSetRGBFillColor(c, SK_FLOAT_COLOR(resRaw[2]), SK_FLOAT_COLOR(resRaw[1]), SK_FLOAT_COLOR(resRaw[0]), SK_FLOAT_COLOR(resRaw[3]));
}

void SKCGContextSetStrokeColor(CGContextRef c, color_t color) {
    dcolor_t resRaw = SK_COLOR_DATA(color);
    CGContextSetRGBStrokeColor(c, SK_FLOAT_COLOR(resRaw[2]), SK_FLOAT_COLOR(resRaw[1]), SK_FLOAT_COLOR(resRaw[0]), SK_FLOAT_COLOR(resRaw[3]));
}
@implementation UIColor (Util)

-(fcolor_t)red {
    fcolor_t red;
    [self getRed:&red green:NULL blue:NULL alpha:NULL];
    return red;
}

-(fcolor_t)green {
    fcolor_t green;
    [self getRed:NULL green:&green blue:NULL alpha:NULL];
    return green;
}

-(fcolor_t)blue {
    fcolor_t blue;
    [self getRed:NULL green:NULL blue:&blue alpha:NULL];
    return blue;
}

-(fcolor_t)alpha {
    fcolor_t alpha;
    [self getRed:NULL green:NULL blue:NULL alpha:&alpha];
    return alpha;
}

-(ecolor_t)intRed {
    return SK_FLOAT_TO_COLOR(self.red);
}

-(ecolor_t)intGreen {
    return SK_FLOAT_TO_COLOR(self.green);
}

-(ecolor_t)intBlue {
    return SK_FLOAT_TO_COLOR(self.blue);
}

-(ecolor_t)intAlpha {
    return SK_FLOAT_TO_COLOR(self.alpha);
}


+(instancetype)colorWithAlpha:(fcolor_t)alpha red:(fcolor_t)red green:(fcolor_t)green blue:(fcolor_t)blue {
    return [self colorWithRed:red green:green blue:blue alpha:alpha];
}

+(instancetype)colorWithIntRed:(ecolor_t)red green:(ecolor_t)green blue:(ecolor_t)blue alpha:(ecolor_t)alpha {
    return [self colorWithFloatAlpha:SK_FLOAT_COLOR(alpha) red:red green:green blue:blue];
}

+(instancetype)colorWithIntAlpha:(ecolor_t)alpha red:(ecolor_t)red green:(ecolor_t)green blue:(ecolor_t)blue {
    return [self colorWithFloatAlpha:SK_FLOAT_COLOR(alpha) red:red green:green blue:blue];
}

+(instancetype) colorWithFloatAlpha:(CGFloat)alpha red:(ecolor_t)red green:(ecolor_t)green blue:(ecolor_t)blue {
    return [self colorWithRed:SK_FLOAT_COLOR(red) green:SK_FLOAT_COLOR(green) blue:SK_FLOAT_COLOR(blue) alpha:alpha];
}

+(instancetype) colorWithIntRed:(ecolor_t)red green:(ecolor_t)green blue:(ecolor_t)blue floatAlpha:(CGFloat)alpha {
    return [self colorWithFloatAlpha:alpha red:red green:green blue:blue];
}

+(instancetype)colorWithInt:(color_t)color {
    ecolor_t* colorRaw = (ecolor_t*) &color;
    return [self colorWithIntAlpha:colorRaw[3] red:colorRaw[2] green:colorRaw[1] blue:colorRaw[0]];
}

+(instancetype) randomColor {
    color_t color = arc4random() | 0xff000000;
    return [self colorWithInt:color];
}
+(instancetype) randomColorWithAlpha {
    return [self colorWithInt:arc4random()];
}

//format is: #ff345678
+(instancetype)colorWithString:(NSString *)color {
    
    if([color isEqual:[NSNull null]])
    {
        return nil;
    }
    
    
    if (color.length  != SK_STR_COLOR_LEN || [color characterAtIndex:0] != '#') {
        return nil;
    }
    color = [color substringFromIndex:1];
    ecolor_t hex[4];
    for (int i = 0; i < 4; i ++) {
        hex[i] = hexcharsToBit([color characterAtIndex:i<<1], [color characterAtIndex:(i<<1) + 1]);
    }
    return [UIColor colorWithIntAlpha:hex[0] red:hex[1] green:hex[2] blue:hex[3]];
}

+(instancetype) colorWithInt:(color_t)color floatAlpha:(CGFloat)alpha {
    ecolor_t* colorRaw = (ecolor_t*) &color;
    return [self colorWithFloatAlpha:alpha red:colorRaw[2] green:colorRaw[1] blue:colorRaw[0]];
}
+(instancetype) colorWithString:(NSString*)color floatAlpha:(CGFloat)alpha {
    color_t c = [self stringToInt:color];
    return [self colorWithInt:c floatAlpha:alpha];
}

+(NSString*) intToString:(color_t)intValue {
    ecolor_t* resRaw = (uint8_t*) &intValue;
    char* buff = malloc((SK_STR_COLOR_LEN + 1) * sizeof(char));
    buff[0] = '#';
    for (int i = 0; i < 4; i ++) {
        bitToHexChars(resRaw[3 - i], buff + (i << 1) + 1);
    }
    buff[SK_STR_COLOR_LEN] = '\0';
    NSString* result = [NSString stringWithUTF8String:buff];
    free(buff);
    return result;
}
+(color_t) stringToInt:(NSString*)stringValue {
    if (stringValue.length  != SK_STR_COLOR_LEN || [stringValue characterAtIndex:0] != '#') {
        return 0;
    }
    stringValue = [stringValue substringFromIndex:1];
    ecolor_t hex[4];
    for (int i = 0; i < 4; i ++) {
        hex[3-i] = hexcharsToBit([stringValue characterAtIndex:i<<1], [stringValue characterAtIndex:(i<<1) + 1]);
    }
    return *((color_t*)hex);
}

-(color_t)intValue {
    fcolor_t red, green, blue, alpha;
    [self getRed:&red green:&green blue:&blue alpha:&alpha];
    return floatRgbaToInt(red, green, blue, alpha);
}

-(NSString*)stringValue {
    return [UIColor intToString:self.intValue];
}

+ (UIColor *) colorWithHexString: (NSString *) hexString {
    
    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString: @"#"withString: @""] uppercaseString];
    
    CGFloat alpha, red, blue, green;
    
    switch ([colorString length]) {
            
        case 3: // #RGB
            
            alpha = 1.0f;
            
            red   = [self colorComponentFrom: colorString start: 0 length: 1];
            
            green = [self colorComponentFrom: colorString start: 1 length: 1];
            
            blue  = [self colorComponentFrom: colorString start: 2 length: 1];
            
            break;
            
        case 4: // #ARGB
            
            alpha = [self colorComponentFrom: colorString start: 0 length: 1];
            
            red   = [self colorComponentFrom: colorString start: 1 length: 1];
            
            green = [self colorComponentFrom: colorString start: 2 length: 1];
            
            blue  = [self colorComponentFrom: colorString start: 3 length: 1];
            
            break;
            
        case 6: // #RRGGBB
            
            alpha = 1.0f;
            
            red   = [self colorComponentFrom: colorString start: 0 length: 2];
            
            green = [self colorComponentFrom: colorString start: 2 length: 2];
            
            blue  = [self colorComponentFrom: colorString start: 4 length: 2];
            
            break;
            
        case 8: // #AARRGGBB
            
            alpha = [self colorComponentFrom: colorString start: 0 length: 2];
            
            red   = [self colorComponentFrom: colorString start: 2 length: 2];
            
            green = [self colorComponentFrom: colorString start: 4 length: 2];
            
            blue  = [self colorComponentFrom: colorString start: 6 length: 2];
            
            break;
            
        default:
            
            [NSException raise:@"Invalid color value" format: @"Color value %@ is invalid.  It should be a hex value of the form #RBG, #ARGB, #RRGGBB, or #AARRGGBB", hexString];
            
            break;
            
    }
    
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];
    
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    
    unsigned hexComponent;
    
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    
    return hexComponent / 255.0;
    
}

@end
