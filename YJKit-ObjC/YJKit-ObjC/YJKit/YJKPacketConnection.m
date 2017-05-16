//
//  YJKPacketConnection.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "YJKPacketConnection.h"
//#import "AFNetworking.h"
#import "ConstsConfig.h"
#import "YJKUtil.h"

@implementation YJKPacketConnection

+ (void)sendRequest:(YJKRequest *)request finished:(void (^)(YJKResponse *response))finished
{
    /*
    NSString *fullPath = [apiPath stringByAppendingPathComponent:request.path];
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:fullPath parameters:request.packetDictionary progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"JSON: %@", [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        [YJKPacketConnection didRequest:request responseObject:responseObject finished:finished];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSLog(@"JSON: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
        [YJKPacketConnection didRequest:request responseObject:data finished:finished];
    }];
    */
}

+ (void)didRequest:(YJKRequest *)request responseObject:(id)responseObject finished:(void (^)(YJKResponse *response))finished
{
    if (finished) {
        if (responseObject) {
            id json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:NULL];
            YJKResponse *response = [[YJKResponse alloc] initWithJSON:json];
            if (request.isSerialize) {
                [YJKPacketConnection cacheSave:request data:responseObject];
            }
            finished(response);
        }
        else {
            finished([YJKPacketConnection sendRequest:request]);
        }
    }
}

+ (YJKResponse *)sendRequest:(YJKRequest *)request
{
    if (request.isSerialize) {
        NSData *data = [YJKPacketConnection cacheRequest:request];
        if (data) {
            id json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:NULL];
            return [[YJKResponse alloc] initWithJSON:json];
        }
        return nil;
    }
    return nil;
}

+ (NSData *)cacheRequest:(YJKRequest *)request
{
    return [NSData dataWithContentsOfFile:[NSString stringWithFormat:@"%@/Packet_%@.bin", cachesPath(), request.md5]];
}

+ (void)cacheSave:(YJKRequest *)request data:(NSData *)data
{
    [data writeToFile:[NSString stringWithFormat:@"%@/Packet_%@.bin", cachesPath(), request.md5] atomically:YES];
}

@end
