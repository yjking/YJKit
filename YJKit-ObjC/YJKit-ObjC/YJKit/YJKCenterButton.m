//
//  YJKCenterButton.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2018/4/15.
//  Copyright © 2018年 杨坚. All rights reserved.
//

#import "YJKCenterButton.h"

@implementation YJKCenterButton

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGPoint actrualCenter = CGPointMake(self.frame.size.width * 0.5, self.frame.size.height * 0.5);
    
    if (self.imageView) {
        CGPoint imageCenter = actrualCenter;
        imageCenter.x += self.imageOffset.x;
        imageCenter.y += self.imageOffset.y;
        self.imageView.center = imageCenter;
    }
    
    if (self.titleLabel) {
        CGPoint titleCenter = actrualCenter;
        titleCenter.x += self.titleOffset.x;
        titleCenter.y += self.titleOffset.y;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        CGRect rect = self.titleLabel.frame;
        rect.size.width = self.frame.size.width;
        self.titleLabel.frame = rect;
        self.titleLabel.center = titleCenter;
    }
}

@end
