//
//  GVImageAnalizerServiceImplemenation.m
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "AFHTTPSessionManager.h"

#import "GVImageAnalizerServiceImplemenation.h"

static NSString * const GVUploadServerHost = @"https://20161206t150800-dot-go-bookshelf-148108.appspot-preview.com/upload";

@implementation GVImageAnalizerServiceImplemenation

- (void)postImageOnServer:(UIImage *)image {
    NSURLRequest *request = [self requestWithImage:image];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask =
    [session dataTaskWithRequest:request
                    completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                        data = data ?: [NSData data];
                        NSDictionary *representation =
                        [NSJSONSerialization JSONObjectWithData:data
                                                        options:kNilOptions
                                                          error:nil];
                        NSLog(@"representation = %@", representation);
                    }];
    [dataTask resume];
}

- (NSURLRequest *)requestWithImage:(UIImage *)image {
    NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
    NSError *error = [[NSError alloc] init];
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer new];
    NSMutableURLRequest *request = [requestSerializer multipartFormRequestWithMethod:@"POST"
                                                                          URLString:GVUploadServerHost
                                                                         parameters:nil
                                                          constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
                                                              [formData appendPartWithFileData:imageData
                                                                                          name:@"photo"
                                                                                      fileName:@"photo.jpg"
                                                                                      mimeType:@"image/jpeg"];
                                                          }
                                                                              error:&error];
    return [request copy];
}

@end
