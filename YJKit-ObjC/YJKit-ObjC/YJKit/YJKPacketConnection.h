//
//  YJKPacketConnection.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "YJKRequest.h"
#import "YJKResponse.h"

@interface YJKPacketConnection : NSObject

/**
 发送请求
 */
+ (void)sendRequest:(YJKRequest *)request finished:(void (^)(YJKResponse *response))finished;

/**
 从缓存中获取响应
 */
+ (YJKResponse *)sendRequest:(YJKRequest *)request;

/**
 直接获取缓存
 */
+ (NSData *)cacheRequest:(YJKRequest *)request;

/**
 直接保存缓存
 */
+ (void)cacheSave:(YJKRequest *)request data:(NSData *)data;

@end
