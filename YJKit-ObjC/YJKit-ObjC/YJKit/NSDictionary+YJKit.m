//
//  NSDictionary+YJKit.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/6.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "NSDictionary+YJKit.h"

@implementation NSDictionary (YJKit)

- (BOOL)boolForKey:(id _Nonnull)aKey {
    BOOL value = NO;
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:NSNumber.class]) {
        NSNumber *number = object;
        value = number.boolValue;
    }
    return value;
}

- (int)intForKey:(id _Nonnull)aKey {
    int value = 0;
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:NSNumber.class]) {
        NSNumber *number = object;
        value = number.intValue;
    }
    else if ([object isKindOfClass:NSString.class]) {
        NSString *str = object;
        value = str.intValue;
    }
    return value;
}

- (long long)longLongForKey:(id _Nonnull)aKey
{
    long long value = 0;
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:NSNumber.class]) {
        NSNumber *number = object;
        value = number.longLongValue;
    }
    else if ([object isKindOfClass:NSString.class]) {
        NSString *str = object;
        value = str.longLongValue;
    }
    return value;
}

- (NSInteger)integerForKey:(id _Nonnull)aKey {
    NSInteger value = 0;
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:NSNumber.class]) {
        NSNumber *number = object;
        value = number.integerValue;
    }
    else if ([object isKindOfClass:NSString.class]) {
        NSString *str = object;
        value = str.integerValue;
    }
    return value;
}

- (NSUInteger)unsignedIntegerForKey:(id _Nonnull)aKey {
    NSUInteger value = 0;
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:NSNumber.class]) {
        NSNumber *number = object;
        value = number.unsignedIntegerValue;
    }
    else if ([object isKindOfClass:NSString.class]) {
        NSString *str = object;
        value = str.integerValue;
    }
    return value;
}

- (double)doubleForKey:(id _Nonnull)aKey {
    double value = 0;
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:NSNumber.class]) {
        NSNumber *number = object;
        value = number.doubleValue;
    }
    else if ([object isKindOfClass:NSString.class]) {
        NSString *str = object;
        value = str.floatValue;
    }
    return value;
}

- (nullable NSString *)stringForKey:(id _Nonnull)aKey {
    NSString *str = @"";
    id object = [self objectForKey:aKey];
    if ([object isKindOfClass:NSString.class]) {
        str = object;
    }
    return str;
}

@end


@implementation NSMutableDictionary (YJKit)

- (void)setNullObject:(nullable id)anObject forKey:(id<NSCopying> _Nonnull)aKey {
    if ([anObject isKindOfClass:NSString.class] || [anObject isKindOfClass:NSDictionary.class] || [anObject isKindOfClass:NSArray.class] || [anObject isKindOfClass:NSNumber.class] || [anObject isKindOfClass:NSData.class]) {
        self[aKey] = anObject;
    }
}

@end
