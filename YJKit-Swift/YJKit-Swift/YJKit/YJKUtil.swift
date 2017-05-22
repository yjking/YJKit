//
//  YJKUtil.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/17.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

public func cachesPath() -> String {
    return NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0]
}

public func simpleChinese() -> Bool {
    return (UserDefaults.standard.stringArray(forKey: "AppleLanguages")?[0].hasPrefix("zh-Hans"))!
}

public func traditionalChinese() -> Bool {
    return (UserDefaults.standard.stringArray(forKey: "AppleLanguages")?[0].hasPrefix("zh-Hant"))!
}
