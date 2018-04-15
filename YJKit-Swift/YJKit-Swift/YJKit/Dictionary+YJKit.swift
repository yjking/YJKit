//
//  Dictionary+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2018/4/15.
//  Copyright © 2018年 杨坚. All rights reserved.
//

import UIKit

extension Dictionary {
    
    /// 直接获取指定Key的Bool
    public func bool(forKey: Key) -> Bool {
        var value = false
        let obj = self[forKey]
        if obj is NSNumber {
            let number: NSNumber = obj as! NSNumber
            value = number.boolValue
        }
        return value;
    }
    
    /// 直接获取指定Key的Int
    public func int(forKey: Key) -> Int {
        var value = 0
        let obj = self[forKey]
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
    public func int64(forKey: Key) -> Int64 {
        var value: Int64 = 0
        let obj = self[forKey]
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
    public func uint(forKey: Key) -> UInt {
        var value: UInt = 0
        let obj = self[forKey]
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
    public func double(forKey: Key) -> Double {
        var value: Double = 0
        let obj = self[forKey]
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
    
    /// 直接获取指定Key的Float
    public func float(forKey: Key) -> Float {
        var value: Float = 0
        let obj = self[forKey]
        if obj is NSNumber {
            let number: NSNumber = obj as! NSNumber
            value = number.floatValue
        }
        else if obj is NSString {
            let str: NSString = obj as! NSString
            value = str.floatValue
        }
        return value;
    }
    
    /// 直接获取指定Key的String
    public func string(forKey: Key) -> String {
        var str = ""
        let obj = self[forKey]
        if obj is String {
            str = obj as! String
        }
        else if obj is NSNumber {
            str = "\(obj as! NSNumber)"
        }
        return str;
    }
}
