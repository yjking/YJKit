//
//  YJKResponse.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "YJKResponse.h"
#import "NSDictionary+YJKit.h"

@interface YJKResponse ()

@property (nonatomic, strong) NSMutableDictionary *packetDictionary;

@end

@implementation YJKResponse

- (id)initWithJSON:(id)JSON
{
    if (self = [super init]) {
        if ([JSON isKindOfClass:[NSDictionary class]]) {
            self.packetDictionary = [NSMutableDictionary dictionaryWithDictionary:JSON];
            self.resultCode = [self.packetDictionary unsignedIntegerForKey:@"resultCode"];
            self.resultDesc = self.packetDictionary[@"resultDesc"];
        }
    }
    return self;
}

@end
