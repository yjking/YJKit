//
//  NSString+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/18.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

extension NSString {
    
    /// 准确比较版本号大小
    open func compareVersion(version: NSString) -> ComparisonResult {
        let arr0 = self.components(separatedBy: ".")
        let arr1 = version.components(separatedBy: ".")
        var result = ComparisonResult.orderedSame
        let count0 = arr0.count;
        let count1 = arr1.count;
        for i in 0..<count0 {
            if i < count1 {
                let str0: NSString = arr0[i] as NSString
                let str1: NSString = arr1[i] as NSString
                let num0 = str0.integerValue
                let num1 = str1.integerValue
                if num0 < num1 {
                    result = ComparisonResult.orderedAscending
                    break
                }
                else if num0 > num1 {
                    result = ComparisonResult.orderedDescending
                    break
                }
            }
            else if count0 > count1 {
                let str0: NSString = arr0[count1] as NSString
                if str0.integerValue > 0 {
                    result = ComparisonResult.orderedDescending
                }
                break
            }
        }
        
        if result == ComparisonResult.orderedSame, count0 < count1 {
            let str1: NSString = arr1[count0] as NSString
            if str1.integerValue > 0 {
                result = ComparisonResult.orderedAscending
            }
        }
        
        return result
    }
    
    /// md5加密（其中十六进制小写）
    var md5: String! {
        
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
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
    var md5Uppercase: String! {
        
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CC_LONG(self.lengthOfBytes(using: String.Encoding.utf8))
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
    
    /// 验证是否手机号（11位）
    var evaluateMobile: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "(^(13\\d|15[^4,\\D]|17[13678]|18\\d)\\d{8}|170[^346,\\D]\\d{7})$").evaluate(with: self) && self.length == 11
    }
    
    /// 验证是否纯英文
    var evaluateEnglish: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^[\\x20-\\x7e]*$").evaluate(with: self)
    }
    
    /// 计算Label的Size
    open func caculationSize(label: UILabel) -> CGSize {
        return .caculationSize(label: label.frame.size.width, font: label.font)
    }
    
    /// 指定width和字体计算Size
    open func caculationSize(width: CGFloat, font: UIFont) -> CGSize {
        return .boundingRect(with: CGSizeMake(width, MAXFLOAT), options: NSStringDrNSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeadingawingOptions, attributes: [NSFontAttributeName : font]?, context: nil).size
    }
    
    /// 中文算1个字，英文算半个字
    var unicodeLength: Int {
        var asciiLength = 0
        let length = self.length
        for i in 0..<length {
            let uc = self.character(at: i)
            asciiLength += isascii(uc) ? 1 : 2
        }
        
        var unicodeLength = asciiLength / 2
        
        if (asciiLength % 2) {
            unicodeLength++
        }
        
        return unicodeLength
    }
    
    /// 清除两端空格
    open func trim() -> String {
        var result = String.init(self)
        while result.hasPrefix(" ") || result.hasPrefix("\\u3000") {
            result = result.substring(from: 1)
        }
        
        while result.hasSuffix(" ") || result.hasSuffix("\\u3000") {
            result = result.substring(to: result.length - 1)
        }
        
        return result
    }
    
    /// 清除开头空格
    open func trimLeft() -> String {
        var result = String.init(self)
        while result.hasPrefix(" ") || result.hasPrefix("\\u3000") || result.hasPrefix("\\n") {
            result = result.substring(from: 1)
        }
        
        return result
    }
    
    /// 清除结尾空格
    open func trimRight() -> String {
        var result = String.init(self)
        while result.hasSuffix(" ") || result.hasSuffix("\\u3000") || result.hasSuffix("\\n") {
            result = result.substring(to: result.length - 1)
        }
        
        return result
    }
    
    /// iOS中\r是换行的，而安卓不换行，这里是兼容转换
    open func replaceWrap() -> String {
        var result = String.init(self)
        result = result.replacingOccurrences(of: "\\r\\n", with: "\\n")
        return result.replacingOccurrences(of: "\\r", with: "\\n")
    }
    
    /// 转换成拼音
    var transformToPinyin: NSString {
        var mutableString = NSMutableString.init(string: self)
        CFStringTransform(CFMutableStringRef(mutableString), NULL, kCFStringTransformToLatin, false)
        mutableString = mutableString.folding(options: CompareOptions.diacriticInsensitive, locale: NSLocale.current)
        return mutableString.replacingOccurrences(of: "'", with: "")
    }
}

extension NSAttributedString {
    
    /// 指定width计算Size
    open func caculationSize(width: CGFloat) -> CGSize {
        return .boundingRect(with: CGSizeMake(width, MAXFLOAT), options: NSStringDrNSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeadingawingOptions, context: nil).size
    }
    
}
