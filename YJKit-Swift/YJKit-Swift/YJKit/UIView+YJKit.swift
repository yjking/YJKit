//
//  UIView+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/22.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import Foundation

extension UIView {
    var imageRender: UIImage {
        UIGraphicsBeginImageContext(.bounds.size)
        .layer.renderInContext(UIGraphicsGetCurrentContext())
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    var imageRenderScale: UIImage {
        UIGraphicsBeginImageContextWithOptions(.bounds.size, true, UIScreen.mainScreen.scale)
        .layer.renderInContext(UIGraphicsGetCurrentContext())
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    var imageRenderRetina: UIImage {
        UIGraphicsBeginImageContext(.bounds.size, true, 2)
            .layer.renderInContext(UIGraphicsGetCurrentContext())
        var image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }

}
