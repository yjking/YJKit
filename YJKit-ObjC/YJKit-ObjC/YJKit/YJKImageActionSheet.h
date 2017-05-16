//
//  YJKImageActionSheet.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YJKImageActionSheetDelegate <NSObject>

- (void)imagePickerSuccessfully:(BOOL)flag image:(UIImage *)image;

@optional
- (void)imageActionSheetDidChoose:(BOOL)flag;

@end

@interface YJKImageActionSheet : NSObject <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

+ (void)imagePicker:(id<YJKImageActionSheetDelegate>)delegate;

@end
