//
//  ConstsConfig.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/18.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

/// 本APP的apple ID
public let appleID = "1044134302"

/// AppStore下载地址
public let iTunesPath = "https://itunes.apple.com/us/app/luo-bo-shu-zhai/id1044134302?ls=1&mt=8"

/// iTunes上获取APP版本信息的地址
public let iTunesCheckVersionPath = "http://itunes.apple.com/lookup?id=1044134302"

#if DEBUG
    /// 接口地址
public let apiPath = "http://app.xxx.com/test"
#else
    /// 接口地址
public let apiPath = "http://app.xxx.com/"
#endif
