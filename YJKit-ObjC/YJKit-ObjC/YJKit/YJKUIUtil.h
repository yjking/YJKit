//
//  YJKUIUtil.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ImageSaveBlock)(UIImage *image, NSError *error, void *contextInfo);

UIWindow *windowLevelNormal(void);
BOOL iOS8(void);
BOOL iPhone45(void);
BOOL iPhone6Plus(void);

@interface YJKUIUtil : NSObject

+ (void)registerForRemoteNotification;
+ (BOOL)enabledRemoteNotification;
+ (void)openURL:(NSURL*)url;
+ (void)imageWriteToSavedPhotosAlbum:(UIImage *)image finished:(ImageSaveBlock)finished;

@end
