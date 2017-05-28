//
//  NSDictionary+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/18.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

extension NSDictionary {
    
    /// 直接获取指定Key的Bool
    open func bool(forKey: Any) -> Bool {
        var value = false
        let obj = self.object(forKey: forKey)
        if obj is NSNumber {
            let number: NSNumber = obj as! NSNumber
            value = number.boolValue
        }
        return value;
    }
    
    /// 直接获取指定Key的Int
    open func int(forKey: Any) -> Int {
        var value = 0
        let obj = self.object(forKey: forKey)
        if obj is NSNumber {
            let number: NSNumber = obj as! NSNumber
            value = number.intValue
        }
        else if obj is NSString {
            let str: NSString = obj as! NSString
            value = str.integerValue
        }
        return value;
    }
    
    /// 直接获取指定Key的Int64
    open func int64(forKey: Any) -> Int64 {
        var value: Int64 = 0
        let obj = self.object(forKey: forKey)
        if obj is NSNumber {
            let number: NSNumber = obj as! NSNumber
            value = number.int64Value
        }
        else if obj is NSString {
            let str: NSString = obj as! NSString
            value = str.longLongValue
        }
        return value;
    }
    
    /// 直接获取指定Key的UInt
    open func uint(forKey: Any) -> UInt {
        var value: UInt = 0
        let obj = self.object(forKey: forKey)
        if obj is NSNumber {
            let number: NSNumber = obj as! NSNumber
            value = number.uintValue
        }
        else if obj is NSString {
            let str: NSString = obj as! NSString
            value = UInt(str.integerValue)
        }
        return value;
    }
    
    /// 直接获取指定Key的Double
    open func double(forKey: Any) -> Double {
        var value: Double = 0
        let obj = self.object(forKey: forKey)
        if obj is NSNumber {
            let number: NSNumber = obj as! NSNumber
            value = number.doubleValue
        }
        else if obj is NSString {
            let str: NSString = obj as! NSString
            value = str.doubleValue
        }
        return value;
    }
    
    /// 直接获取指定Key的NSString
    open func string(forKey: Any) -> NSString {
        var str: NSString = ""
        let obj = self.object(forKey: forKey)
        if obj is NSString {
            str = obj as! NSString
        }
        return str;
    }
}

extension NSMutableDictionary {
    
    /// 直接设置值，而不用担心其为nil而崩溃
    open func setNullObject(anObject: Any, forKey: Any) {
        if anObject is NSString || anObject is NSDictionary || anObject is NSArray || anObject is NSNumber || anObject is NSData {
            self[forKey] = anObject
        }
    }
}
