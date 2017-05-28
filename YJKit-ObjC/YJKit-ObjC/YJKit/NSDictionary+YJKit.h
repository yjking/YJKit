//
//  NSDictionary+YJKit.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/6.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJKit)

/**
 直接获取指定Key的BOOL
 */
- (BOOL)boolForKey:(id _Nonnull)aKey;

/**
 直接获取指定Key的int
 */
- (int)intForKey:(id _Nonnull)aKey;

/**
 直接获取指定Key的long long
 */
- (long long)longLongForKey:(id _Nonnull)aKey;

/**
 直接获取指定Key的NSInteger
 */
- (NSInteger)integerForKey:(id _Nonnull)aKey;

/**
 直接获取指定Key的NSUInteger
 */
- (NSUInteger)unsignedIntegerForKey:(id _Nonnull)aKey;

/**
 直接获取指定Key的double
 */
- (double)doubleForKey:(id _Nonnull)aKey;

/**
 直接获取指定Key的NSString
 */
- (nullable NSString *)stringForKey:(id _Nonnull)aKey;

@end


@interface NSMutableDictionary (YJKit)

/**
 直接设置值，而不用担心其为nil而崩溃
 */
- (void)setNullObject:(nullable id)anObject forKey:(id<NSCopying> _Nonnull)aKey;

@end
