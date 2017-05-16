//
//  UIImage+YJKit.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YJKit)

+ (UIImage *)gifNamed:(NSString *)name;
+ (UIImage *)gifWithData:(NSData *)data;
+ (UIImage *)imageWithLine:(UIViewContentMode)mode color:(UIColor *)color;

@end
