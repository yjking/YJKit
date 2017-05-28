//
//  YJKUIUtil.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 图片保存回调Block
 */
typedef void(^ImageSaveBlock)(UIImage *image, NSError *error, void *contextInfo);

/**
 普通层级的窗体（通常是AppDelegate的window）
 */
UIWindow *windowLevelNormal(void);

/**
 是否iOS8
 */
BOOL iOS8(void);

/**
 屏幕宽度为320的机型：iPhone4，4s，5，5s，se等
 */
BOOL iPhone45(void);

/**
 屏幕宽度为414的机型:iPhone6Plus，6sPlus，7Plus等
 */
BOOL iPhone6Plus(void);

@interface YJKUIUtil : NSObject

/**
 注册推送
 */
+ (void)registerForRemoteNotification;

/**
 是否允许推送
 */
+ (BOOL)enabledRemoteNotification;

/**
 打开指定URL
 */
+ (void)openURL:(NSURL*)url;

/**
 保存图片到相册
 */
+ (void)imageWriteToSavedPhotosAlbum:(UIImage *)image finished:(ImageSaveBlock)finished;

@end
