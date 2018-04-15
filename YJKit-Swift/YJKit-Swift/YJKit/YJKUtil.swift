//
//  YJKUtil.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/17.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

/// 获取caches目录
public func cachesPath() -> String {
    return NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
}

/// 是否简体中文
public func simpleChinese() -> Bool {
    return (UserDefaults.standard.stringArray(forKey: "AppleLanguages")?[0].hasPrefix("zh-Hans"))!
}

/// 是否繁体中文
public func traditionalChinese() -> Bool {
    return (UserDefaults.standard.stringArray(forKey: "AppleLanguages")?[0].hasPrefix("zh-Hant"))!
}
