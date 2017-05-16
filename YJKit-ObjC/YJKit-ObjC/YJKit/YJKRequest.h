//
//  YJKRequest.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YJKRequest : NSObject

@property (nonatomic, copy) NSString *path;
@property (nonatomic, assign) int tag;
@property (nonatomic, assign) BOOL isSerialize;

- (instancetype)initWithTimestamp:(long)timestamp;
- (NSString *)JSONString;
- (NSMutableDictionary *)packetDictionary;
- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey;
- (NSString *)md5;

@end
