//
//  NSString+YJKit.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/7.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (YJKit)

- (NSComparisonResult)compareVersion:(NSString *_Nonnull)string;
- (nonnull NSString *)md5;
- (nonnull NSString *)md5Uppercase;
- (BOOL)evaluateEmail;
- (BOOL)evaluateInteger;
- (BOOL)evaluateMobile;
- (BOOL)evaluateEnglish;
- (CGSize)caculationSize:(UILabel *_Nonnull)label;
- (CGSize)caculationSize:(CGFloat)width font:(UIFont *_Nonnull)font;
- (NSUInteger)unicodeLength;
- (nonnull NSString *)trim;
- (nonnull NSString *)trimLeft;
- (nonnull NSString *)trimRight;
- (nonnull NSString *)replaceWrap;

@end


@interface NSAttributedString (YJKit)

- (CGSize)caculationSize:(CGFloat)width;

@end
