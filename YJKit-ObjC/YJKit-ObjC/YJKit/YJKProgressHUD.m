//
//  YJKProgressHUD.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "YJKProgressHUD.h"
#import "YJKUIUtil.h"

@implementation YJKProgressHUD

+ (YJKProgressHUD *)sharedProgressHUD
{
    static YJKProgressHUD *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YJKProgressHUD alloc] init];
    });
    return instance;
}

+ (void)showWithText:(NSString *)text
{
    [YJKProgressHUD showWithText:text view:windowLevelNormal()];
}

+ (void)showWithDetails:(NSString *)text
{
    [YJKProgressHUD showWithDetails:text view:windowLevelNormal()];
}

+ (void)showWithText:(NSString *)text view:(UIView *)view
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.label.text = text;
    hud.delegate = [YJKProgressHUD sharedProgressHUD];
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:3];
    hud.userInteractionEnabled = NO;
}

+ (void)showWithDetails:(NSString *)text view:(UIView *)view
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    
    hud.mode = MBProgressHUDModeCustomView;
    hud.detailsLabel.text = text;
    hud.delegate = [YJKProgressHUD sharedProgressHUD];
    [hud showAnimated:YES];
    [hud hideAnimated:YES afterDelay:3];
    hud.userInteractionEnabled = NO;
}

- (void)hudWasHidden:(MBProgressHUD *)hud
{
    [hud removeFromSuperview];
}

@end
