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

+ (void)sendRequest:(YJKRequest *)request finished:(void (^)(YJKResponse *response))finished;
+ (YJKResponse *)sendRequest:(YJKRequest *)request;
+ (NSData *)cacheRequest:(YJKRequest *)request;
+ (void)cacheSave:(YJKRequest *)request data:(NSData *)data;

@end
