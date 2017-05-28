//
//  YJKRequest.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJKRequest : NSObject

/**
 请求名
 */
@property (nonatomic, copy) NSString *path;

/**
 用于区分请求的标识
 */
@property (nonatomic, assign) int tag;

/**
 是否进行缓存
 */
@property (nonatomic, assign) BOOL isSerialize;

/**
 根据时间戳来初始化
 */
- (instancetype)initWithTimestamp:(long)timestamp;

/**
 JSON形式
 */
- (NSString *)JSONString;

/**
 Dictionary形式
 */
- (NSMutableDictionary *)packetDictionary;

/**
 设置键值
 */
- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey;

/**
 md5形式
 */
- (NSString *)md5;

@end
