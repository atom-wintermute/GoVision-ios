//
//  GVImageAnalizerSerializer.h
//  GoVision
//
//  Created by Nikulin Maksim on 13/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol GVImageAnalizerSerializer <NSObject>

- (NSURLRequest *)requestForUploadImage:(UIImage *)image;

@end
