//
//  NSString+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/18.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

extension NSString {
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
    
    var evaluateEmail: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b").evaluate(with: self)
    }
    
    var evaluateInteger: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^[0-9]+$").evaluate(with: self)
    }
    
    var evaluateMobile: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "(^(13\\d|15[^4,\\D]|17[13678]|18\\d)\\d{8}|170[^346,\\D]\\d{7})$").evaluate(with: self) && self.length == 11
    }
    
    var evaluateEnglish: Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^[\\x20-\\x7e]*$").evaluate(with: self)
    }
    
    open func caculationSize(label: UILabel) -> CGSize {
        return .caculationSize(label: label.frame.size.width, font: label.font)
    }
    
    open func caculationSize(width: CGFloat, font: UIFont) -> CGSize {
        return .boundingRect(with: CGSizeMake(width, MAXFLOAT), options: NSStringDrNSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeadingawingOptions, attributes: [NSFontAttributeName : font]?, context: nil).size
    }
    
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
    
    open func trimLeft() -> String {
        var result = String.init(self)
        while result.hasPrefix(" ") || result.hasPrefix("\\u3000") || result.hasPrefix("\\n") {
            result = result.substring(from: 1)
        }
        
        return result
    }
    
    open func trimRight() -> String {
        var result = String.init(self)
        while result.hasSuffix(" ") || result.hasSuffix("\\u3000") || result.hasSuffix("\\n") {
            result = result.substring(to: result.length - 1)
        }
        
        return result
    }
    
    open func replaceWrap() -> String {
        var result = String.init(self)
        result = result.replacingOccurrences(of: "\\r\\n", with: "\\n")
        return result.replacingOccurrences(of: "\\r", with: "\\n")
    }
    
}

extension NSAttributedString {
    open func caculationSize(width: CGFloat) -> CGSize {
        return .boundingRect(with: CGSizeMake(width, MAXFLOAT), options: NSStringDrNSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeadingawingOptions, context: nil).size
    }
    
}
