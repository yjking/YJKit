//
//  YJKRequest.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "YJKRequest.h"
#import "ConstsConfig.h"
#import "NSDictionary+YJKit.h"
#import "NSString+YJKit.h"
#include <sys/utsname.h>

@interface YJKRequest ()

@property (nonatomic, strong) NSMutableDictionary *packetDictionary;

@end

@implementation YJKRequest

- (instancetype)init
{
    if (self = [self initWithTimestamp:[[NSDate date] timeIntervalSince1970]]) {
    }
    return self;
}

- (instancetype)initWithTimestamp:(long)timestamp
{
    if (self = [super init]) {
        [self setObject:[NSNumber numberWithLong:timestamp] forKey:@"timestamp"];
        [self setObject:[NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"] forKey:@"appVersion"];
        
        struct utsname systemInfo;
        uname(&systemInfo);
        [self setObject:[NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding] forKey:@"deviceType"];
        [self setObject:[UIDevice currentDevice].systemVersion forKey:@"systemVersion"];
        [self setObject:[self signature:self.packetDictionary] forKey:@"sign"];
    }
    return self;
}

- (NSString *)JSONString
{
    return [[NSString alloc] initWithData:[NSJSONSerialization dataWithJSONObject:self.packetDictionary options:NSJSONWritingPrettyPrinted error:nil] encoding:NSUTF8StringEncoding];
}

- (NSMutableDictionary *)packetDictionary
{
    if (!_packetDictionary) {
        _packetDictionary = [NSMutableDictionary dictionary];
    }
    return _packetDictionary;
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey
{
    [self.packetDictionary setNullObject:anObject forKey:aKey];
}

- (NSString *)md5
{
    NSMutableDictionary *dic = self.packetDictionary.mutableCopy;
    [dic removeObjectForKey:@"timestamp"];
    [dic removeObjectForKey:@"sign"];
    return [self signature:dic];
}

- (NSString *)signature:(NSDictionary *)packetDictionary
{
    NSString *string = @"";
    NSArray *ascendingKey = [self sortArrayDesc:packetDictionary.allKeys];
    
    for (NSString *key in ascendingKey) {
        NSString *str = [packetDictionary objectForKey:key];
        str = [str.description stringByReplacingOccurrencesOfString:@" " withString:@""]; //去掉所有空格
        str = [str stringByTrimmingCharactersInSet:NSCharacterSet.newlineCharacterSet]; //去掉两端换行符
        
        if ( [key isEqualToString:@"sign"] || [key isEqualToString:@"image"] || [key isEqualToString:@"audio"] || str.length == 0 ) {
            continue;
        }
        
        string = [NSString stringWithFormat:@"%@%@%@", string, key, str];
    }
    
    return string.md5Uppercase;
}

- (NSArray *)sortArrayDesc:(NSArray *)array
{
    NSArray *sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(NSString *obj1, NSString *obj2){
        return [obj1 compare:obj2];
    }];
    return sortedArray;
}

@end
