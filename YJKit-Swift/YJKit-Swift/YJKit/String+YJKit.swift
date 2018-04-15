//
//  String+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2018/4/15.
//  Copyright © 2018年 杨坚. All rights reserved.
//

import UIKit

extension String {
    
    /// 字符长度
    public var length: Int {
        return count
    }
    
    /// 准确比较版本号大小
    public func compareVersion(version: String) -> ComparisonResult {
        let arr0 = components(separatedBy: ".")
        let arr1 = version.components(separatedBy: ".")
        var result = ComparisonResult.orderedSame
        let count0 = arr0.count;
        let count1 = arr1.count;
        for i in 0..<count0 {
            if i < count1 {
                let str0 = arr0[i]
                let str1 = arr1[i]
                let num0 = Int(str0) ?? 0
                let num1 = Int(str1) ?? 0
                if num0 < num1 {
                    result = .orderedAscending
                    break
                }
                else if num0 > num1 {
                    result = .orderedDescending
                    break
                }
            }
            else if count0 > count1 {
                let str0 = arr0[count1]
                if Int(str0) ?? 0 > 0 {
                    result = .orderedDescending
                }
                break
            }
        }
        
        if result == .orderedSame, count0 < count1 {
            let str1 = arr1[count0]
            if Int(str1) ?? 0 > 0 {
                result = .orderedAscending
            }
        }
        
        return result
    }
    
    /// md5加密（其中十六进制小写）
    var md5: String {
        
        let str = cString(using: .utf8)
        let strLen = CC_LONG(lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02x", result[i])
        }
        
        result.deallocate(capacity: digestLen)
        
        return String(format: hash as String)
    }
    
    /// md5加密（其中十六进制大写）
    var md5Uppercase: String {
        
        let str = cString(using: .utf8)
        let strLen = CC_LONG(lengthOfBytes(using: .utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str!, strLen, result)
        
        let hash = NSMutableString()
        for i in 0..<digestLen {
            hash.appendFormat("%02X", result[i])
        }
        
        result.deallocate(capacity: digestLen)
        
        return String(format: hash as String)
    }
    
    /// 验证是否电子邮箱
    var evaluateEmail: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b").evaluate(with: self)
    }
    
    /// 验证是否整数
    var evaluateInteger: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^[0-9]+$").evaluate(with: self)
    }
    
    /// 验证是否数字和英文字母
    var evaluateAlphanumeric: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "[\\da-zA-Z]+").evaluate(with: self)
    }
    
    /// 验证是否手机号（11位）
    var evaluateMobile: Bool {
        return evaluateInteger && length == 11
    }
    
    /// 验证是否手机号（13,15,17,18）
    var evaluateMobileEx: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "(^(13\\d|15[^4,\\D]|17[13678]|18\\d)\\d{8}|170[^346,\\D]\\d{7})$").evaluate(with: self) && length == 11
    }
    
    /// 验证是否纯英文
    var evaluateEnglish: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^[\\x20-\\x7e]*$").evaluate(with: self)
    }
    
    /// 验证身份证号码，18位
    var evaluateIDCard: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^\\d{17}([0-9]|X)$").evaluate(with: self)
    }
    
    /// 验证身份证号码，支持15位和18位
    var evaluateIDCardEx: Bool {
        var result = NSPredicate.init(format: "SELF MATCHES %@", "(^\\d{15}$)|(^\\d{17}([0-9]|X)$)").evaluate(with: self)
        if result {
            // 省份代码。如果需要更精确的话，可以把六位行政区划代码都列举出来比较。
            let provinceCode = String(self[..<index(startIndex, offsetBy: 2)])
            let proviceCodes = [
                "11", "12", "13", "14", "15",
                "21", "22", "23",
                "31", "32", "33", "34", "35", "36", "37",
                "41", "42", "43", "44", "45", "46",
                "50", "51", "52", "53", "54",
                "61", "62", "63", "64", "65",
                "71", "81", "82", "91"]
            
            if proviceCodes.contains(provinceCode) {
                if self.length == 15 {
                    /// 15位身份证号码验证。6位行政区划代码 + 6位出生日期码(yyMMdd) + 3位顺序码
                    /// 00后都是18位的身份证号
                    let birthday = "19\(String(self[index(startIndex, offsetBy: 6)..<index(startIndex, offsetBy: 12)]))"
                    result = birthday.validateBirthDate
                }
                else {
                    /// 18位身份证号码验证。6位行政区划代码 + 8位出生日期码(yyyyMMdd) + 3位顺序码 + 1位校验码
                    let birthday = String(self[index(startIndex, offsetBy: 6)..<index(startIndex, offsetBy: 14)])
                    if birthday.validateBirthDate {
                        let weight = [7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2]
                        var sum = 0
                        for i in 0..<17 {
                            sum += Int(String(self[index(startIndex, offsetBy: i)..<index(startIndex, offsetBy: i + 1)])) ?? 0 * weight[i]
                        }
                        
                        let mod11 = sum % 11
                        let array = ["1", "0", "X", "9", "8", "7", "6", "5", "4", "3", "2"]
                        result = hasSuffix(array[mod11])
                    }
                }
            }
        }
        
        return result
    }
    
    /// 验证出生年月日(yyyyMMdd)
    var validateBirthDate: Bool {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyyMMdd"
        return dateFormatter.date(from: self) != nil
    }
    
    /// 可变字符串去除头尾空格和换行
    public mutating func trim() {
        self = trimmed()
    }
    
    /// 得到的新字符串，去除了头尾空格和换行
    public func trimmed() -> String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    /// iOS中\r是换行的，而安卓不换行，这里是兼容转换
    public func replaceWrap() -> String {
        return replacingOccurrences(of: "\\r\\n", with: "\\n").replacingOccurrences(of: "\\r", with: "\\n")
    }
    
    /// 转换成拼音
    var transformToPinyin: String {
        let mutableString = NSMutableString(string: self)
        CFStringTransform(mutableString, nil, kCFStringTransformToLatin, false)
        CFStringTransform(mutableString, nil, kCFStringTransformStripDiacritics, false)
        let string = mutableString.folding(options: .diacriticInsensitive, locale: .current)
        return string.replacingOccurrences(of: "'", with: "")
    }
    
}
