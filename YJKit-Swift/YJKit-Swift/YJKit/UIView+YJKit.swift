//
//  UIView+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2017/5/22.
//  Copyright © 2017年 杨坚. All rights reserved.
//

import UIKit

extension UIView {
    
    var x: CGFloat {
        set(x) {
            var frame = self.frame
            frame.origin.x = x
            self.frame = frame;
        }
        
        get {
            return self.frame.origin.x
        }
    }
    
    var y: CGFloat {
        set(y) {
            var frame = self.frame
            frame.origin.y = y
            self.frame = frame
        }
        
        get {
            return frame.origin.y
        }
    }
    
    var width: CGFloat {
        
        set(width) {
            var frame = self.frame
            frame.size.width = width
            self.frame = frame
        }
        
        get {
            return frame.size.width
        }
    }
    
    var height: CGFloat {
        
        set(height) {
            var frame = self.frame
            frame.size.height = height
            self.frame = frame
        }
        
        get {
            return frame.size.height
        }
    }
    
    var centerX: CGFloat {
        set(centerX) {
            var center = self.center
            center.x = centerX
            self.center = center
        }
        
        get {
            return self.center.x
        }
    }
    
    var centerY: CGFloat {
        set(centerY) {
            var center = self.center
            center.y = centerY
            self.center = center
        }
        
        get {
            return self.center.y
        }
    }
    
    var size: CGSize {
        
        set(size) {
            var frame = self.frame
            frame.size = size
            self.frame = frame
        }
        
        get {
            return frame.size
        }
    }
    
    var origin: CGPoint {
        set(origin) {
            var frame = self.frame
            frame.origin = origin
            self.frame = frame
        }
        
        get {
            return frame.origin
        }
    }
    
    var right: CGFloat {
        set(right) {
            var frame = self.frame
            frame.origin.x = right - frame.size.width
            self.frame = frame
        }
        
        get {
            return frame.origin.x + frame.size.width
        }
    }
    
    var bottom: CGFloat {
        set(bottom) {
            var frame = self.frame
            frame.origin.y = bottom - frame.size.height
            self.frame = frame
        }
        
        get {
            return frame.origin.y + frame.size.height
        }
    }
    
    /// 截图
    var imageRender: UIImage {
        UIGraphicsBeginImageContext(self.bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        }
        
        return UIImage()
    }
    
    /// 截图（图像按当前屏幕的倍率）
    var imageRenderScale: UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, UIScreen.main.scale)
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        }

        return UIImage()
    }
    
    /// 截图（图像按当前屏幕的2倍）
    var imageRenderRetina: UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, true, 2)
        if let context = UIGraphicsGetCurrentContext() {
            self.layer.render(in: context)
            return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        }
        
        return UIImage()
    }

}
