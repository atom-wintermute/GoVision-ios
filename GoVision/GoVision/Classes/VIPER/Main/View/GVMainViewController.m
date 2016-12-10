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

#pragma mark - Методы GVMainViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
}

- (void)showImage:(UIImage *)image {
    self.imageView.image = image;
}

- (void)updateViewWithResult:(GLAnalizeResult)result {
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

@end
