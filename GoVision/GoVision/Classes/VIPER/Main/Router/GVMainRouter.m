//
//  GVMainRouter.m
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVMainRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation GVMainRouter

#pragma mark - Методы GVMainRouterInput

- (void)showImagePickerCamera {
    UIImagePickerController *imagePicker = [UIImagePickerController new];
    imagePicker.delegate = self.imagePickerDelegate;
    imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    imagePicker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    
    UIViewController *rootViewController = (UIViewController *)self.transitionHandler;
    [rootViewController presentViewController:imagePicker animated:YES completion:nil];
}

@end
