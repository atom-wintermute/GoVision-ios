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
    
}

#pragma mark - Методы GVMainViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
}

@end
