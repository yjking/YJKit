//
//  YJKUIUtil.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "YJKUIUtil.h"
#import <UserNotifications/UserNotifications.h>

UIWindow *windowLevelNormal(void)
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    if (window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = [UIApplication sharedApplication].windows;
        for (UIWindow *tmpWin in windows) {
            if (tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    
    return window;
}

BOOL iOS8(void)
{
    static BOOL value = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *arr = [[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."];
        if (arr.count) {
            NSString *str = arr[0];
            value = [str isEqualToString:@"8"];
        }
    });
    return value;
}

BOOL iPhone45(void)
{
    static BOOL value = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        value = [UIScreen mainScreen].bounds.size.width == 640.0 / 2;
    });
    return value;
}

BOOL iPhone6Plus(void)
{
    static BOOL value = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        value = [UIScreen mainScreen].bounds.size.width == 1242.0 / 3;
    });
    return value;
}

@interface YJKUIUtil ()

@property (nonatomic, strong) ImageSaveBlock imageSaveBlock;

@end

@implementation YJKUIUtil

+ (YJKUIUtil *)sharedYJKUIUtil {
    static YJKUIUtil *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YJKUIUtil alloc] init];
    });
    return instance;
}

+ (void)registerForRemoteNotification {
    if ([UIApplication instancesRespondToSelector:@selector(registerForRemoteNotifications)]) {
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
            UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
            [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
                if (!error) {
                    NSLog(@"request authorization succeeded!");
                }
            }];
        }
        else {
            [[UIApplication sharedApplication] registerForRemoteNotifications];
            
            [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound) categories:nil]];
        }
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else {
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound)];
    }
}

+ (BOOL)enabledRemoteNotification {
    if ([UIApplication instancesRespondToSelector:@selector(isRegisteredForRemoteNotifications)]) {
        return [UIApplication sharedApplication].isRegisteredForRemoteNotifications;
    }
    else {
        return UIRemoteNotificationTypeNone != [UIApplication sharedApplication].enabledRemoteNotificationTypes;
    }
}

+ (void)openURL:(NSURL*)url
{
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:)]) {
            [[UIApplication sharedApplication] openURL:url];
        }
        else if ([[UIApplication sharedApplication] respondsToSelector:@selector(openURL:options:completionHandler:)]) {
            [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionUniversalLinksOnly: @(YES)} completionHandler:nil];
        }
    }
}

+ (void)imageWriteToSavedPhotosAlbum:(UIImage *)image finished:(ImageSaveBlock)finished
{
    YJKUIUtil *UIUtil = [YJKUIUtil sharedYJKUIUtil];
    UIUtil.imageSaveBlock = finished;
    UIImageWriteToSavedPhotosAlbum(image, UIUtil, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (self.imageSaveBlock) {
        self.imageSaveBlock(image, error, contextInfo);
    }
}

@end
