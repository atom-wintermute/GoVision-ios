//
//  GVMainPresenter.m
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVMainPresenter.h"

#import "GVMainViewInput.h"
#import "GVMainInteractorInput.h"
#import "GVMainRouterInput.h"

#import "AssetsLibrary/AssetsLibrary.h"
#import <Photos/Photos.h>

#import "UIImage+OrientationFix.h"

static CGFloat const GVMaximumSize = 1000.0;

@interface GVMainPresenter ()

@property (nonatomic, copy) UIImage *currentImage;

@end

@implementation GVMainPresenter

#pragma mark - Методы GVMainModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы GVMainViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

- (void)didTriggerCameraButtonPressedEvent {
    [self.router showImagePickerCamera];
}

- (void)didTriggerGalleryButtonPressedEvent {
    [self.router showImagePickerGallery];
}

- (void)didTriggerAnalizeButtonPressedEvent {
    UIImage *scaledImage = [self compressedImageFromImage:self.currentImage];
    NSLog(@"scaled image size = %f %f", scaledImage.size.width, scaledImage.size.height);
    [self.interactor postImageOnServer:scaledImage];
}

#pragma mark - Методы GVMainInteractorOutput

- (void)updateScreenWithResult:(GLAnalizeResult)result {
    [self.view updateViewWithResult:result];
}

#pragma mark - Методы UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    if (info[UIImagePickerControllerOriginalImage]) {
        UIImage *image = [info[UIImagePickerControllerOriginalImage] imageWithFixedOrientation];
        NSURL *imageURL = info[UIImagePickerControllerReferenceURL];
        
        if (imageURL) {
            self.currentImage = image;
            NSLog(@"size = %f %f", image.size.width, image.size.height);
            void (^block)(void) = ^{
                [self.view showImage:image];
            };
            run_block_on_main(block)
            return;
        }
        
        // assets
        PHPhotoLibrary *library = [PHPhotoLibrary sharedPhotoLibrary];
        [library performChanges:^{
            [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (!error) {
                self.currentImage = image;
                void (^block)(void) = ^{
                    [self.view showImage:image];
                };
                run_block_on_main(block)
            }
        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Методы UINavigationControllerDelegate

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController {
    return UIInterfaceOrientationPortrait;
}

#pragma mark - Вспомогательные методы

- (UIImage *)compressedImageFromImage:(UIImage *)image {
    CGSize currentSize = image.size;
    CGFloat maximumSide = MAX(currentSize.width, currentSize.height);
    
    if (maximumSide < GVMaximumSize) {
        return image;
    }
    CGFloat ratio = GVMaximumSize / maximumSide;
    CGSize newSize = CGSizeApplyAffineTransform(currentSize, CGAffineTransformMakeScale(ratio, ratio));
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
