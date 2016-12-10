//
//  GVImageAnalizerService.h
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GVImageAnalizerService <NSObject>

- (void)postImageOnServer:(UIImage *)image;

@end
