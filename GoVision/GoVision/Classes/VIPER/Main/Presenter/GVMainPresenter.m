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
    [self.interactor postImageOnServer:self.currentImage];
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
            [self.view showImage:image];
            return;
        }
        
        // assets
        PHPhotoLibrary *library = [PHPhotoLibrary sharedPhotoLibrary];
        [library performChanges:^{
            [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (!error) {
                self.currentImage = image;
                [self.view showImage:image];
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

@end
