//
//  UIImage+YJKit.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YJKit)

/**
 根据文件名读取gif
 */
+ (UIImage *)gifNamed:(NSString *)name;

/**
 根据data读取gif
 */
+ (UIImage *)gifWithData:(NSData *)data;

/**
 一种特别的在Retina屏幕画一像素线的方法
 */
+ (UIImage *)imageWithLine:(UIViewContentMode)mode color:(UIColor *)color;

@end
