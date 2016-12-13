//
//  GVImageAnalizerSerializerImplementation.m
//  GoVision
//
//  Created by Nikulin Maksim on 13/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVImageAnalizerSerializerImplementation.h"

#import "AFHTTPRequestOperationManager.h"

static NSString * const GVUploadServerHost = @"http://20161210t161505-dot-go-bookshelf-148108.appspot-preview.com/upload";


@implementation GVImageAnalizerSerializerImplementation

- (NSURLRequest *)requestForUploadImage:(UIImage *)image {
    NSData *imageData = UIImageJPEGRepresentation(image, 0.35);
    NSError *error;
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer new];
    NSMutableURLRequest *request = [requestSerializer requestWithMethod:@"POST"
                                                              URLString:GVUploadServerHost
                                                             parameters:nil
                                                                  error:&error];
    [request addValue:@"image/jpeg" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:imageData];
    return [request copy];
}

@end
