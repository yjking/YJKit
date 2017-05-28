//
//  YJKImageActionSheet.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol YJKImageActionSheetDelegate <NSObject>

/**
 图片选取完成
 */
- (void)imagePickerSuccessfully:(BOOL)flag image:(UIImage *)image;

@optional

/**
 ActionSheet上做了选择，如果是点了取消则返回NO，其他返回YES
 */
- (void)imageActionSheetDidChoose:(BOOL)flag;

@end

@interface YJKImageActionSheet : NSObject <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

/**
 弹出拍照和从相册选取图片的选项
 */
+ (void)imagePicker:(id<YJKImageActionSheetDelegate>)delegate;

@end
