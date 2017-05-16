//
//  YJKProgressHUD.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "MBProgressHUD.h"

@interface YJKProgressHUD : NSObject <MBProgressHUDDelegate>

+ (void)showWithText:(NSString *)text;
+ (void)showWithDetails:(NSString *)text;
+ (void)showWithText:(NSString *)text view:(UIView *)view;
+ (void)showWithDetails:(NSString *)text view:(UIView *)view;

@end
