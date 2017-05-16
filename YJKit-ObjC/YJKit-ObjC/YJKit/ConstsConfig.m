//
//  ConstsConfig.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "ConstsConfig.h"

NSString *const appleID = @"1044134302";
NSString *const iTunesPath = @"https://itunes.apple.com/us/app/luo-bo-shu-zhai/id1044134302?ls=1&mt=8";
NSString *const iTunesCheckVersionPath = @"http://itunes.apple.com/lookup?id=1044134302";
#if DEBUG
NSString *const apiPath = @"http://app.xxx.com/test";
#else
NSString *const apiPath = @"http://app.xxx.com/";
#endif
