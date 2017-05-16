//
//  YJKImageActionSheet.m
//  YJKit-ObjC
//
//  Created by 杨坚 on 2017/5/16.
//  Copyright © 2017年 杨坚. All rights reserved.
//

#import "YJKImageActionSheet.h"
#import "YJKUIUtil.h"
#import "YJKProgressHUD.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface YJKImageActionSheet ()

@property (nonatomic, weak) id<YJKImageActionSheetDelegate> delegate;
@property (nonatomic, strong) UIPopoverController *popoverController;

@end

@implementation YJKImageActionSheet

+ (YJKImageActionSheet *)sharedImageActionSheet
{
    static YJKImageActionSheet *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YJKImageActionSheet alloc] init];
    });
    return instance;
}

+ (void)imagePicker:(id<YJKImageActionSheetDelegate>)delegate
{
    YJKImageActionSheet *instance = [YJKImageActionSheet sharedImageActionSheet];
    instance.delegate = delegate;
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:instance cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册选择", nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

#pragma mark - UIActionSheetDelegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex < 2) {
        
#if TARGET_IPHONE_SIMULATOR
        
        if (1 - buttonIndex == UIImagePickerControllerSourceTypeCamera) {
            NSLog(@"模拟器无法使用摄像头");
            return;
        }
        
#else
        if (1 - buttonIndex == UIImagePickerControllerSourceTypeCamera) {
            BOOL videoEnable = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo] != AVAuthorizationStatusDenied;
            
            if (!videoEnable) {
                [YJKProgressHUD showWithText:@”VideoNotAllowAccess“];
            }
        }
        
#endif
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIImagePickerController *picker = [[UIImagePickerController alloc] init];
            picker.delegate = self;
            picker.sourceType = 1 - buttonIndex;
            UIWindow *windows = windowLevelNormal();
            if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
                [windows.rootViewController presentViewController:picker animated:YES completion:NULL];
            }
            else {
                self.popoverController = [[UIPopoverController alloc] initWithContentViewController:picker];
                [self.popoverController presentPopoverFromRect:CGRectMake(0, 0, 60, 1024) inView:windows permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
            }
        });
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(imageActionSheetDidChoose:)]) {
        [self.delegate imageActionSheetDidChoose:buttonIndex < 2];
    }
}

#pragma mark - UIImagePickerControllerDelegate Methods

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }
    else {
        [self.popoverController dismissPopoverAnimated:YES];
    }
    if ([[info objectForKey:UIImagePickerControllerMediaType] isEqual:(NSString *)kUTTypeImage]) {
        UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
        [self.delegate imagePickerSuccessfully:YES image:image];
    }
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
        [picker dismissViewControllerAnimated:YES completion:NULL];
    }
    else {
        [self.popoverController dismissPopoverAnimated:YES];
    }
    [self.delegate imagePickerSuccessfully:NO image:nil];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

@end
