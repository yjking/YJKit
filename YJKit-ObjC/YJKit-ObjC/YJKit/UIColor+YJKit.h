//
//  UIColor+YJKit.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (YJKit)

+ (UIColor *)colorWithRGB:(NSUInteger)rgb;
+ (UIColor *)colorWithRGB:(NSUInteger)rgb alpha:(CGFloat)alpha;

+ (UIColor *)colorWithHex:(NSString *)hex;
+ (UIColor *)colorWithHex:(NSString *)hex alpha:(CGFloat)alpha;

- (NSUInteger)argb;

@end
