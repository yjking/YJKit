//
//  UIColor+YJKit.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "UIColor+YJKit.h"

@implementation UIColor (YJKit)

+ (UIColor *)colorWithRGB:(NSUInteger)rgb
{
    return [UIColor colorWithRGB:rgb alpha:1.0f];
}

+ (UIColor *)colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha
{
    return [UIColor colorWithRed:((rgb >> 16) & 0xFF) * 0.0039215686 green:((rgb >> 8) & 0xFF) * 0.0039215686 blue:(rgb & 0xFF) * 0.0039215686 alpha:alpha];
}

+ (UIColor *)colorWithHex:(NSString *)hex
{
    return [UIColor colorWithHex:hex alpha:1.0f];
}

+ (UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha
{
    NSString *cString = [hex stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].uppercaseString;
    
    if ([cString hasPrefix:@"#"]) {
        cString = [cString substringFromIndex:1];
    }
    
    if (cString.length != 6) {
        return [UIColor clearColor];
    }
    
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:(r / 255.0)
                           green:(g / 255.0)
                            blue:(b / 255.0)
                           alpha:alpha];
}

- (NSUInteger)argb
{
    NSUInteger argb = 0;
    CGFloat r, g, b, a;
    [self getRed:&r green:&g blue:&b alpha:&a];
    argb += (NSUInteger)(a * 255) << 24;
    argb += (NSUInteger)(r * 255) << 16;
    argb += (NSUInteger)(g * 255) << 8;
    argb += (NSUInteger)(b * 255);
    return argb;
}

@end
