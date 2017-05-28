//
//  UIView+YJKit.h
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YJKit)

/**
 截图
 */
- (UIImage *)imageRender;

/**
 截图（图像按当前屏幕的倍率）
 */
- (UIImage *)imageRenderScale;

/**
 截图（图像按当前屏幕的2倍）
 */
- (UIImage *)imageRenderRetina;

@end
