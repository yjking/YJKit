//
//  YJKProgressHUD.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "MBProgressHUD.h"

@interface YJKProgressHUD : NSObject <MBProgressHUDDelegate>

/**
 单行文字提示，在Window显示
 */
+ (void)showWithText:(NSString *)text;

/**
 多行文字提示，在Window显示
 */
+ (void)showWithDetails:(NSString *)text;

/**
 单行文字提示，在指定View显示
 */
+ (void)showWithText:(NSString *)text view:(UIView *)view;

/**
 多行文字提示，在指定View显示
 */
+ (void)showWithDetails:(NSString *)text view:(UIView *)view;

@end
