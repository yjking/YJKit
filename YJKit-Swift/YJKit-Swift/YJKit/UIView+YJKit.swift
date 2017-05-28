//
//  UIView+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/22.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

extension UIView {
    
    /// 截图
    var imageRender: UIImage {
        UIGraphicsBeginImageContext(.bounds.size)
        .layer.renderInContext(UIGraphicsGetCurrentContext())
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 截图（图像按当前屏幕的倍率）
    var imageRenderScale: UIImage {
        UIGraphicsBeginImageContextWithOptions(.bounds.size, true, UIScreen.mainScreen.scale)
        .layer.renderInContext(UIGraphicsGetCurrentContext())
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /// 截图（图像按当前屏幕的2倍）
    var imageRenderRetina: UIImage {
        UIGraphicsBeginImageContext(.bounds.size, true, 2)
            .layer.renderInContext(UIGraphicsGetCurrentContext())
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
