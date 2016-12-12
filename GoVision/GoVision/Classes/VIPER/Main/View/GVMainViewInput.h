//
//  GVMainViewInput.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GVImageAnalizerService.h"

@protocol GVMainViewInput <NSObject>

/**
 @author Nikulin Maxim

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

- (void)showImage:(UIImage *)image;

- (void)updateViewWithResult:(GLAnalizeResult)result;

- (UIImage *)obtainCurrentImage;

@end
