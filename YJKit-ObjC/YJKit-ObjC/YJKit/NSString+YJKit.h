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

/**
 准确比较版本号大小
 */
- (NSComparisonResult)compareVersion:(NSString *_Nonnull)string;

/**
 md5加密（其中十六进制小写）
 */
- (nonnull NSString *)md5;

/**
 md5加密（其中十六进制大写）
 */
- (nonnull NSString *)md5Uppercase;

/**
 验证是否电子邮箱
 */
- (BOOL)evaluateEmail;

/**
 验证是否整数
 */
- (BOOL)evaluateInteger;

/**
 验证是否手机号（11位）
 */
- (BOOL)evaluateMobile;

/**
 验证是否纯英文
 */
- (BOOL)evaluateEnglish;

/**
 计算Label的Size
 */
- (CGSize)caculationSize:(UILabel *_Nonnull)label;

/**
 指定width和字体计算Size
 */
- (CGSize)caculationSize:(CGFloat)width font:(UIFont *_Nonnull)font;

/**
 中文算1个字，英文算半个字
 */
- (NSUInteger)unicodeLength;

/**
 清除两端空格
 */
- (nonnull NSString *)trim;

/**
 清除开头空格
 */
- (nonnull NSString *)trimLeft;

/**
 清除结尾空格
 */
- (nonnull NSString *)trimRight;

/**
 iOS中\r是换行的，而安卓不换行，这里是兼容转换
 */
- (nonnull NSString *)replaceWrap;

/**
 转换成拼音
 */
- (nonnull NSString *)transformToPinyin;

@end


@interface NSAttributedString (YJKit)

/**
 指定width计算Size
 */
- (CGSize)caculationSize:(CGFloat)width;

@end
