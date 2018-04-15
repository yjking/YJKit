//
//  YJKImageActionSheet.swift
//  YJKit-Swift
//
//  Created by 杨坚 on 2018/4/15.
//  Copyright © 2018年 杨坚. All rights reserved.
//

import UIKit
import MobileCoreServices

var imageActionSheet = YJKImageActionSheet()

class YJKImageActionSheet: NSObject {
    
    var viewController: UIViewController?
    var completionHandler: ((UIImage?) -> Void)?
    
    class func imagePicker(_ viewController: UIViewController?, _ completionHandler: @escaping (_ image: UIImage?) -> Void) {
        imageActionSheet.completionHandler = completionHandler
        imageActionSheet.viewController = viewController
        
        let controller = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
        
        controller.addAction(UIAlertAction.init(title: "拍照", style: .default, handler: { _ in
            imageActionSheet.clickedButton(0)
        }))
        
        controller.addAction(UIAlertAction.init(title: "从相册选择", style: .default, handler: { _ in
            imageActionSheet.clickedButton(1)
        }))
        
        controller.addAction(UIAlertAction.init(title: "取消", style: .cancel, handler: nil))
        
        viewController?.present(controller, animated: true, completion: nil)
    }
    
    func clickedButton(_ buttonIndex: Int) {
        
        #if (arch(i386) || arch(x86_64)) && os(iOS)
            
            if 1 - buttonIndex == UIImagePickerControllerSourceType.camera.rawValue {
                print("模拟器无法使用摄像头")
                return
            }
            
        #else
            
            if 1 - buttonIndex == UIImagePickerControllerSourceType.camera.rawValue {
                let videoEnable = AVCaptureDevice.authorizationStatus(for: .video) != .denied
                
                if !videoEnable {
                    SVProgressHUD.showError(withStatus: "请在设置允许访问摄像头")
                }
            }
            
        #endif
        
        let picker = UIImagePickerController()
        picker.delegate = self
        if let sourceType = UIImagePickerControllerSourceType.init(rawValue: 1 - buttonIndex) {
            picker.sourceType = sourceType
        }
        self.viewController?.present(picker, animated: true, completion: {
            
            UIApplication.shared.statusBarStyle = .default
        })
        
    }
}

extension YJKImageActionSheet: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if info.string(forKey: UIImagePickerControllerMediaType) == kUTTypeImage as String {
            let image = info[UIImagePickerControllerOriginalImage]
            if completionHandler != nil {
                completionHandler!(image as? UIImage)
            }
        }
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
        
        if completionHandler != nil {
            completionHandler!(nil)
        }
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
}
