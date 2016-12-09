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

@end
