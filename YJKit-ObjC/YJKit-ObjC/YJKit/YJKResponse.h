//
//  YJKResponse.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, YJKResultCode){
    YJKResultCodeDefault,
    YJKResultCodeSuccess = 200,
    YJKResultCodeReject = 249,
    YJKResultCodeNotFound = 404
};

@interface YJKResponse : NSObject

@property (nonatomic, assign) YJKResultCode resultCode;
@property (nonatomic, copy) NSString *resultDesc;

- (id)initWithJSON:(id)JSON;
- (NSMutableDictionary *)packetDictionary;

@end
