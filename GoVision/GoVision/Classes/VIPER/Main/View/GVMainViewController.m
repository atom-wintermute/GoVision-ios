//
//  GVMainViewController.m
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVMainViewController.h"

#import "GVMainViewOutput.h"

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
    
    [self.output didTriggerAnalizeButtonPressedEvent];
}

#pragma mark - Методы GVMainViewInput

- (void)setupInitialState {
    [self enableButton:self.analizeButton enable:NO];
}

- (void)showImage:(UIImage *)image {
    self.imageView.image = image;
    [self enableButton:self.analizeButton enable:YES];
}

- (void)updateViewWithResult:(GLAnalizeResult)result {
    [self enableButton:self.analizeButton enable:YES];
    [self enableButton:self.cameraButton enable:YES];
    [self enableButton:self.galleryButton enable:YES];
    
    switch (result) {
        case GLAnalizeResultUnlikely:
            self.resultLabel.textColor = [UIColor greenColor];
            self.resultLabel.text = @"unlikely";
            break;
        case GLAnalizeResultVeryUnlikely:
            self.resultLabel.textColor = [UIColor greenColor];
            self.resultLabel.text = @"very unlikely";
            break;
        case GLAnalizeResultVeryLikely:
            self.resultLabel.textColor = [UIColor redColor];
            self.resultLabel.text = @"very likely";
            break;
        case GLAnalizeResultLikely:
            self.resultLabel.textColor = [UIColor redColor];
            self.resultLabel.text = @"likely";
            break;
        case GLAnalizeResultUnknown:
            self.resultLabel.textColor = [UIColor grayColor];
            self.resultLabel.text = @"unknown";
            break;
        case GLAnalizeResultPossible:
            self.resultLabel.textColor = [UIColor yellowColor];
            self.resultLabel.text = @"possible";
            break;
        default:
            break;
    }
}

#pragma mark - Вспомогательные методы

- (void)enableButton:(UIButton *)button
              enable:(BOOL)enable {
    button.userInteractionEnabled = enable;
    button.enabled = enable;
}

@end
