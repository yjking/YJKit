//
//  YJKResponse.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 响应状态码
 */
typedef NS_ENUM(NSUInteger, YJKResultCode){
    YJKResultCodeDefault,
    YJKResultCodeSuccess = 200,
    YJKResultCodeReject = 249,
    YJKResultCodeNotFound = 404
};

@interface YJKResponse : NSObject

/**
 状态码
 */
@property (nonatomic, assign) YJKResultCode resultCode;

/**
 结果描述
 */
@property (nonatomic, copy) NSString *resultDesc;

/**
 根据JSON来初始化
 */
- (id)initWithJSON:(id)JSON;

/**
 Dictionary形式
 */
- (NSMutableDictionary *)packetDictionary;

@end
