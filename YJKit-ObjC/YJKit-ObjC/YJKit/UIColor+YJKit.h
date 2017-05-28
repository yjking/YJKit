//
//  UIColor+YJKit.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YJKit)

/**
 根据整型的rgb值得出color
 */
+ (UIColor *)colorWithRGB:(NSUInteger)rgb;

/**
 根据整型的rgb值得出color，alpha为小数
 */
+ (UIColor *)colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha;

/**
 根据十六进制字符串得出color（开头可以包含#号）
 */
+ (UIColor *)colorWithHex:(NSString *)hex;

/**
 根据十六进制字符串得出color（开头可以包含#号），alpha为小数
 */
+ (UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha;

/**
 倒推得出rgb值
 */
- (NSUInteger)argb;

@end
