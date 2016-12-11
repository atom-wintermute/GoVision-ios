//
//  GVMainViewController.m
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVMainViewController.h"

#import "GVMainViewOutput.h"

#import "PECropView.h"

@implementation GVMainViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - IBActions

- (void)cameraButtonWasPressed:(id)sender {
    [self.output didTriggerCameraButtonPressedEvent];
}

- (void)galleryButtonWasPressed:(id)sender {
    [self.output didTriggerGalleryButtonPressedEvent];
}

- (void)analizeButtonWasPressed:(id)sender {
    [self enableButton:self.analizeButton enable:NO];
    [self enableButton:self.cameraButton enable:NO];
    [self enableButton:self.galleryButton enable:NO];
    self.resultLabel.text = @"";
    [self.activity startAnimating];
    
    [self.output didTriggerAnalizeButtonPressedEvent];
}

#pragma mark - Методы GVMainViewInput

- (void)setupInitialState {
    self.cropView = [[PECropView alloc] initWithFrame:self.imageView.frame];
    self.cropView.clipsToBounds = YES;
    
    self.strawberry1.alpha = 0.15;
    self.strawberry2.alpha = 0.15;
    self.strawberry3.alpha = 0.15;
    self.strawberry4.alpha = 0.15;
    self.strawberry5.alpha = 0.15;
    
    [self.view addSubview:self.cropView];
    [self.view bringSubviewToFront:self.analizeButton];
    [self.view bringSubviewToFront:self.cameraButton];
    [self.view bringSubviewToFront:self.galleryButton];
    
    [self enableButton:self.analizeButton enable:NO];
}

- (void)showImage:(UIImage *)image {
    self.cropView.image = image;
    [self enableButton:self.analizeButton enable:YES];
}

- (void)updateViewWithResult:(GLAnalizeResult)result {
    [self enableButton:self.analizeButton enable:YES];
    [self enableButton:self.cameraButton enable:YES];
    [self enableButton:self.galleryButton enable:YES];
    [self.activity stopAnimating];
    
    switch (result) {
        case GLAnalizeResultUnlikely:
            self.strawberry1.alpha = 1.0;
            self.strawberry2.alpha = 1.0;
            self.strawberry3.alpha = 0.15;
            self.strawberry4.alpha = 0.15;
            self.strawberry5.alpha = 0.15;
            break;
        case GLAnalizeResultVeryUnlikely:
            self.strawberry1.alpha = 1.0;
            self.strawberry2.alpha = 0.15;
            self.strawberry3.alpha = 0.15;
            self.strawberry4.alpha = 0.15;
            self.strawberry5.alpha = 0.15;
            break;
        case GLAnalizeResultVeryLikely:
            self.strawberry1.alpha = 1.0;
            self.strawberry2.alpha = 1.0;
            self.strawberry3.alpha = 1.0;
            self.strawberry4.alpha = 1.0;
            self.strawberry5.alpha = 1.0;
            break;
        case GLAnalizeResultLikely:
            self.strawberry1.alpha = 1.0;
            self.strawberry2.alpha = 1.0;
            self.strawberry3.alpha = 1.0;
            self.strawberry4.alpha = 1.0;
            self.strawberry5.alpha = 0.15;
            break;
        case GLAnalizeResultUnknown:
            self.strawberry1.alpha = 0.15;
            self.strawberry2.alpha = 0.15;
            self.strawberry3.alpha = 0.15;
            self.strawberry4.alpha = 0.15;
            self.strawberry5.alpha = 0.15;
            break;
        case GLAnalizeResultPossible:
            self.strawberry1.alpha = 1.0;
            self.strawberry2.alpha = 1.0;
            self.strawberry3.alpha = 1.0;
            self.strawberry4.alpha = 0.15;
            self.strawberry5.alpha = 0.15;
            break;
        default:
            break;
    }
}

- (UIImage *)obtainCurrentImage {
    return self.cropView.croppedImage;
}

#pragma mark - Вспомогательные методы

- (void)enableButton:(UIButton *)button
              enable:(BOOL)enable {
    button.userInteractionEnabled = enable;
    button.enabled = enable;
}

@end
