//
//  NSDictionary+YJKit.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/6.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YJKit)


- (BOOL)boolForKey:(id _Nonnull)aKey;
- (int)intForKey:(id _Nonnull)aKey;
- (long long)longLongForKey:(id _Nonnull)aKey;
- (NSInteger)integerForKey:(id _Nonnull)aKey;
- (NSUInteger)unsignedIntegerForKey:(id _Nonnull)aKey;
- (double)doubleForKey:(id _Nonnull)aKey;
- (nullable NSString *)stringForKey:(id _Nonnull)aKey;

@end


@interface NSMutableDictionary (YJKit)

- (void)setNullObject:(nullable id)anObject forKey:(id<NSCopying> _Nonnull)aKey;

@end
