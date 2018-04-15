//
//  YJKCenterButton.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2018/4/15.
//  Copyright © 2018年 杨坚. All rights reserved.
//

import UIKit

class YJKCenterButton: UIButton {

    var imageOffset: CGPoint = .zero
    var titleOffset: CGPoint = .zero
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let actrualCenter = CGPoint(x: frame.width / 2.0, y: frame.height / 2.0)
        if imageView != nil {
            var imageCenter = actrualCenter
            imageCenter.x += imageOffset.x
            imageCenter.y += imageOffset.y
            imageView?.center = imageCenter
        }
        if titleLabel != nil {
            var titleCenter = actrualCenter
            titleCenter.x += titleOffset.x
            titleCenter.y += titleOffset.y
            titleLabel?.textAlignment = .center
            titleLabel?.frame.size.width = frame.width
            titleLabel?.center = titleCenter
        }
    }

}
