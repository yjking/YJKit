//
//  UIColor+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/22.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import UIKit

extension UIColor {
    
    /// 根据整型的rgb值得出color，alpha为小数
    public convenience init(r: Int, g: Int, b: Int, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: alpha)
    }
    
    /// 根据整型的rgb值得出color，alpha为小数
    public convenience init(rgb: Int, alpha: CGFloat = 1.0) {
        let r = (rgb >> 16) & 0xFF
        let g = (rgb >> 8) & 0xFF
        let b = rgb & 0xFF
        self.init(r: r, g: g, b: b, alpha: alpha)
    }
    
    /// 根据十六进制字符串得出color（开头可以包含#号），alpha为小数
    public convenience init(hex: String, alpha: CGFloat = 1.0) {
        let formatted = hex.replacingOccurrences(of: "0x", with: "").replacingOccurrences(of: "#", with: "")
        if let rgb = Int(formatted, radix: 16) {
            self.init(rgb: rgb, alpha: alpha)
        } else {
            self.init()
        }
    }

    /// 倒推得出rgb值
    var argb: Int {
        var argb = 0
        var r = CGFloat(0)
        var g = CGFloat(0)
        var b = CGFloat(0)
        var a = CGFloat(0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        argb += Int(a * 255) << 24
        argb += Int(r * 255) << 16
        argb += Int(g * 255) << 8
        argb += Int(b * 255)
        return argb
    }
}
