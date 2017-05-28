//
//  NSString+YJKit.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/7.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "NSString+YJKit.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YJKit)

- (NSComparisonResult)compareVersion:(NSString *_Nonnull)string {
    NSArray *arr0 = [self componentsSeparatedByString:@"."];
    NSArray *arr1 = [string componentsSeparatedByString:@"."];
    NSComparisonResult result = NSOrderedSame;
    NSUInteger count0 = arr0.count;
    NSUInteger count1 = arr1.count;
    for (NSUInteger i = 0; i < count0; ++i) {
        if (i < count1) {
            NSString *str0 = arr0[i];
            NSString *str1 = arr1[i];
            NSInteger num0 = str0.integerValue;
            NSInteger num1 = str1.integerValue;
            if (num0 < num1) {
                result = NSOrderedAscending;
                break;
            }
            else if (num0 > num1) {
                result = NSOrderedDescending;
                break;
            }
        }
        else if (count0 > count1) {
            NSString *str0 = arr0[count1];
            if (str0.integerValue > 0) {
                result = NSOrderedDescending;
            }
            break;
        }
    }
    
    if (result == NSOrderedSame && count0 < count1) {
        NSString *str1 = arr1[count0];
        if (str1.integerValue > 0) {
            result = NSOrderedAscending;
        }
    }
    
    return result;
}

- (NSString *)md5 {
    const char *cStr = self.UTF8String;
    unsigned char result[16] = { 0 };
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)md5Uppercase {
    const char *cStr = self.UTF8String;
    unsigned char result[16] = { 0 };
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:@"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (BOOL)evaluateEmail {
    static NSPredicate *predicate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"];
    });
    return [predicate evaluateWithObject:self];
}

- (BOOL)evaluateInteger {
    static NSPredicate *predicate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[0-9]+$"];
    });
    return [predicate evaluateWithObject:self];
}

- (BOOL)evaluateMobile {
    static NSPredicate *predicate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"(^(13\\d|15[^4,\\D]|17[13678]|18\\d)\\d{8}|170[^346,\\D]\\d{7})$"];
    });
    return self.length == 11 && [predicate evaluateWithObject:self];
}

- (BOOL)evaluateEnglish {
    static NSPredicate *predicate = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^[\x20-\x7e]*$"];
    });
    return [predicate evaluateWithObject:self];
}

- (CGSize)caculationSize:(UILabel *)label
{
    return [self caculationSize:label.frame.size.width font:label.font];
}

- (CGSize)caculationSize:(CGFloat)width font:(UIFont *)font
{
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)  options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil].size;
}

- (NSUInteger)unicodeLength
{
    NSUInteger asciiLength = 0;
    
    for (NSUInteger i = 0; i < self.length; ++i) {
        unichar uc = [self characterAtIndex:i];
        asciiLength += isascii(uc) ? 1 : 2;
    }
    
    NSUInteger unicodeLength = asciiLength / 2;
    
    if (asciiLength % 2) {
        unicodeLength++;
    }
    
    return unicodeLength;
}

- (NSString *)trim {
    NSString *result = [NSString stringWithString:self];
    while ([result hasPrefix:@" "] || [result hasPrefix:@"\u3000"]) {
        result = [result substringFromIndex:1];
    }
    while ([result hasSuffix:@" "] || [result hasSuffix:@"\u3000"]) {
        result = [result substringToIndex:result.length - 1];
    }
    
    return result;
}

- (NSString *)trimLeft {
    NSString *result = [NSString stringWithString:self];
    while ([result hasPrefix:@"\n"] || [result hasPrefix:@" "] || [result hasPrefix:@"\u3000"]) {
        result = [result substringFromIndex:1];
    }
    
    return result;
}

- (NSString *)trimRight {
    NSString *result = [NSString stringWithString:self];
    while ([result hasSuffix:@"\n"] || [result hasSuffix:@" "] || [result hasSuffix:@"\u3000"]) {
        result = [result substringToIndex:result.length - 1];
    }
    
    return result;
}

- (NSString *)replaceWrap {
    NSString *result = [NSString stringWithString:self];
    
    result = [result stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n" options:NSRegularExpressionSearch range:NSMakeRange(0, result.length)];
    result = [result stringByReplacingOccurrencesOfString:@"\r" withString:@"\n" options:NSRegularExpressionSearch range:NSMakeRange(0, result.length)];
    
    return result;
}

- (NSString *)transformToPinyin {
    NSMutableString *mutableString = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)mutableString, NULL, kCFStringTransformToLatin, false);
    mutableString = (NSMutableString *)[mutableString stringByFoldingWithOptions:NSDiacriticInsensitiveSearch locale:NSLocale.currentLocale];
    return [mutableString stringByReplacingOccurrencesOfString:@"'" withString:@""];
}

@end


@implementation NSAttributedString (YJKit)

- (CGSize)caculationSize:(CGFloat)width
{
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

@end
