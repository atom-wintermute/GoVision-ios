//
//  GVMainViewController.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GVMainViewInput.h"

@protocol GVMainViewOutput;

@interface GVMainViewController : UIViewController <GVMainViewInput>

@property (nonatomic, strong) id<GVMainViewOutput> output;

@property (nonatomic, weak) IBOutlet UIImageView *imageView;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activity;

@property (nonatomic, weak) IBOutlet UIButton *cameraButton;
@property (nonatomic, weak) IBOutlet UIButton *galleryButton;
@property (nonatomic, weak) IBOutlet UIButton *analizeButton;

- (IBAction)cameraButtonWasPressed:(id)sender;

- (IBAction)galleryButtonWasPressed:(id)sender;

- (IBAction)analizeButtonWasPressed:(id)sender;

@end
