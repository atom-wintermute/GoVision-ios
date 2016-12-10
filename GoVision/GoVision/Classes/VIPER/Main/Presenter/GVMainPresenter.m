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

#pragma mark - Методы GVMainInteractorOutput

#pragma mark - Методы UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    if (info[UIImagePickerControllerOriginalImage]) {
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        NSURL *imageURL = info[UIImagePickerControllerReferenceURL];
        
        if (imageURL) {
            [self.view showImage:image];
            [self.interactor postImageOnServer:image];
//            [self.delegate imagePickerController:self
//                              didFinishWithImage:image];
            return;
        }
        
        // assets
        PHPhotoLibrary *library = [PHPhotoLibrary sharedPhotoLibrary];
        [library performChanges:^{
            [PHAssetChangeRequest creationRequestForAssetFromImage:image];
        } completionHandler:^(BOOL success, NSError * _Nullable error) {
            if (error) {
                NSLog(@"Error: %@", error);
            } else {
                [self.view showImage:image];
//                [self.delegate imagePickerController:self
//                                  didFinishWithImage:image];
            }
        }];
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    NSLog(@"imagePicker: didCancel");
}

#pragma mark - Методы UINavigationControllerDelegate

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"navigationController: willShowViewController");
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"navigationController: didShowViewController");
}

- (UIInterfaceOrientationMask)navigationControllerSupportedInterfaceOrientations:(UINavigationController *)navigationController {
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)navigationControllerPreferredInterfaceOrientationForPresentation:(UINavigationController *)navigationController {
    return UIInterfaceOrientationPortrait;
}

@end
