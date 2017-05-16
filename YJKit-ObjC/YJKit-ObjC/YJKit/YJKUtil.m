//
//  YJKUtil.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "YJKUtil.h"

NSString * cachesPath(void)
{
    static NSString *path = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    });
    return path;
}

BOOL simpleChinese(void)
{
    static BOOL value = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *allLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        NSString *preferredLang = allLanguages[0];
        value = [preferredLang hasPrefix:@"zh-Hans"];
    });
    return value;
}

BOOL traditionalChinese(void)
{
    static BOOL value = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSArray *allLanguages = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"];
        NSString *preferredLang = allLanguages[0];
        value = [preferredLang hasPrefix:@"zh-Hant"];
    });
    return value;
}
