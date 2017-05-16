//
//  UIImage+YJKit.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/14.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "UIImage+YJKit.h"
#import <ImageIO/ImageIO.h>
#import "UIView+YJKit.h"

@implementation UIImage (YJKit)

+ (UIImage *)gifNamed:(NSString *)name
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"gif"]];
    if (data) {
        return [UIImage gifWithData:data];
    }
    return [UIImage imageNamed:name];
}

+ (UIImage *)gifWithData:(NSData *)data
{
    UIImage *animatedImage = nil;
    
    if (data) {
        CGImageSourceRef source = CGImageSourceCreateWithData((__bridge CFDataRef)data, NULL);
        size_t count = CGImageSourceGetCount(source);
        
        if (count <= 1) {
            animatedImage = [[UIImage alloc] initWithData:data];
        }
        else {
            NSMutableArray *images = [NSMutableArray array];
            NSTimeInterval duration = 0.0f;
            
            for (size_t i = 0; i < count; ++i) {
                CGImageRef image = CGImageSourceCreateImageAtIndex(source, i, NULL);
                NSDictionary *frameProperties = CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(source, i, NULL));
                duration += [[[frameProperties objectForKey:(NSString *)kCGImagePropertyGIFDictionary] objectForKey:(NSString *)kCGImagePropertyGIFDelayTime] doubleValue];
                [images addObject:[UIImage imageWithCGImage:image scale:[UIScreen mainScreen].scale orientation:UIImageOrientationUp]];
                CGImageRelease(image);
            }
            
            if (!duration) {
                duration = (1.0f / 10.0f) * count;
            }
            
            animatedImage = [UIImage animatedImageWithImages:images duration:duration];
        }
        
        CFRelease(source);
    }
    
    return animatedImage;
}

+ (UIImage *)imageWithLine:(UIViewContentMode)mode color:(UIColor *)color
{
    CGRect rect = CGRectZero;
    rect.size.width = [UIScreen mainScreen].scale;
    rect.size.height = rect.size.width;
    UIView *view = [[UIView alloc] initWithFrame:rect];
    
    switch (mode) {
        case UIViewContentModeLeft:
            rect.size.width = 1;
            break;
        case UIViewContentModeRight:
            rect.origin.x = rect.size.width - 1;
            rect.size.width = 1;
            break;
        case UIViewContentModeTop:
            rect.size.height = 1;
            break;
        case UIViewContentModeBottom:
            rect.origin.y = rect.size.height - 1;
            rect.size.height = 1;
            break;
        default:
            rect.size = CGSizeZero;
            break;
    }
    
    UIView *lineView = [[UIView alloc] initWithFrame:rect];
    lineView.backgroundColor = color;
    [view addSubview:lineView];
    
    return view.imageRender;
}

@end
