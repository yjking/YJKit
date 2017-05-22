//
//  UIColor+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/22.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

extension UIColor {
    class open func color(rgb: Int) -> UIColor {
        return UIColor.color(rgb: rgb, alpha: 1)
    }
    
    class open func color(rgb: Int, alpha: Double) -> UIColor {
        return UIColor.init(colorLiteralRed:((rgb >> 16) & 0xFF) * 0.0039215686, green:((rgb >> 8) & 0xFF) * 0.0039215686, blue:(rgb & 0xFF) * 0.0039215686, alpha:alpha)
    }
    
    class open func color(hex: String) -> UIColor {
        return UIColor.color(hex: hex, alpha: 1)
    }
    
    class open func color(hex: String, alpha: Double) -> UIColor {
        var cString = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") {
            cString = cString.substring(from: 1)
        }
        
        if cString.length != 6 {
            return UIColor.clear
        }
        
        let rString = cString.substring(with: 0..<2)
        let gString = cString.substring(with: 2..<4)
        let bString = cString.substring(with: 4..<6)
        var r: Int, g, b
        Scanner.init(string: rString).scanInt(&r)
        Scanner.init(string: gString).scanInt(&g)
        Scanner.init(string: bString).scanInt(&b)
        
        return UIColor.init(colorLiteralRed:(r / 255.0), green:(g / 255.0), blue:(b / 255.0), alpha:alpha)
    }
    
    var argb: Int {
        var argb = 0
        var r = 0.0, g, b, a
        .getRed(&r, &g, &b, &a)
        argb += Int(a * 255) << 24
        argb += Int(r * 255) << 16
        argb += Int(g * 255) << 8
        argb += Int(b * 255)
        return argb
    }
}
