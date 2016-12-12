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

@class PECropView;

@interface GVMainViewController : UIViewController <GVMainViewInput>

@property (nonatomic, strong) id<GVMainViewOutput> output;

@property (nonatomic, weak) IBOutlet UIView *imageView;
@property (nonatomic, strong) IBOutlet PECropView *cropView;
@property (nonatomic, weak) IBOutlet UILabel *resultLabel;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activity;

@property (nonatomic, weak) IBOutlet UIButton *cameraButton;
@property (nonatomic, weak) IBOutlet UIButton *galleryButton;
@property (nonatomic, weak) IBOutlet UIButton *analizeButton;

@property (nonatomic, weak) IBOutlet UIImageView *strawberry1;
@property (nonatomic, weak) IBOutlet UIImageView *strawberry2;
@property (nonatomic, weak) IBOutlet UIImageView *strawberry3;
@property (nonatomic, weak) IBOutlet UIImageView *strawberry4;
@property (nonatomic, weak) IBOutlet UIImageView *strawberry5;

- (IBAction)cameraButtonWasPressed:(id)sender;

- (IBAction)galleryButtonWasPressed:(id)sender;

- (IBAction)analizeButtonWasPressed:(id)sender;

@end
