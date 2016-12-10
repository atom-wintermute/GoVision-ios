//
//  GVImageAnalizerServiceImplemenation.m
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperationManager.h"

#import "GVImageAnalizerServiceImplemenation.h"

#import "GLBlockHelper.h"

static NSString * const GVUploadServerHost = @"http://20161210t161505-dot-go-bookshelf-148108.appspot-preview.com/upload";

static NSString * const GVResponseResultKey = @"Description";

@implementation GVImageAnalizerServiceImplemenation

#pragma mark - Методы интерфейса

- (void)postImageOnServer:(UIImage *)image completionBlock:(GLAnalizeCompletionBlock)completionBlock {
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
                        NSString *rawResult = representation[GVResponseResultKey];
                        GLAnalizeResult result = [[self resultMapping][rawResult] unsignedIntegerValue];
                        run_block_on_main(completionBlock, nil, result);
                    }];
    [dataTask resume];
}

- (NSURLRequest *)requestWithImage:(UIImage *)image {
    NSData *imageData = UIImageJPEGRepresentation(image, 0.35);
    NSError *error;
    
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer new];
    NSMutableURLRequest *request = [requestSerializer requestWithMethod:@"POST"
                                                              URLString:GVUploadServerHost
                                                             parameters:nil
                                                                  error:&error];
    [request addValue:@"image/jpeg" forHTTPHeaderField: @"Content-Type"];
    [request setHTTPBody:imageData];
    return [request copy];
}

- (NSDictionary *)resultMapping {
    return  @{
              @"UNKNOWN": @(GLAnalizeResultUnknown),
              @"VERY_LIKELY": @(GLAnalizeResultVeryLikely),
              @"LIKELY": @(GLAnalizeResultLikely),
              @"POSSIBLE": @(GLAnalizeResultPossible),
              @"UNLIKELY": @(GLAnalizeResultUnlikely),
              @"VERY_UNLIKELY": @(GLAnalizeResultVeryUnlikely)
              };
}

@end
