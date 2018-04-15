//
//  UITextField+YJKit.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2018/4/15.
//  Copyright © 2018年 杨坚. All rights reserved.
//

import UIKit

extension UITextField {
    public func limit(_ length: Int) {
        
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文被截断
        
        guard let start = markedTextRange?.start else {
            limitText(length)
            return
        }
        
        guard let _ = position(from: start, offset: 0) else {
            limitText(length)
            return
        }
    }
    
    private func limitText(_ length: Int) {
        if let theText = text {
            let textLength = theText.length
            //---字符处理
            if textLength > length {
                //中文和emoj表情存在问题，需要对此进行处理
                var inputLength = 0
                var i = 0
                
                while i < textLength && inputLength <= length {
                    let index = theText.index(theText.startIndex, offsetBy: i)
                    let range = theText.rangeOfComposedCharacterSequence(at: index)
                    inputLength += String(theText[range]).length
                    if inputLength > length {
                        self.text = String(theText[..<range.lowerBound])
                    }
                    i += theText.distance(from: range.lowerBound, to: range.upperBound)
                }
            }
        }
    }
}
