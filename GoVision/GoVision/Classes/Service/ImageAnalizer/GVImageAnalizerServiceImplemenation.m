//
//  GVImageAnalizerServiceImplemenation.m
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVImageAnalizerServiceImplemenation.h"

#import "GVImageAnalizerSerializer.h"

static NSString * const GVResponseResultKey = @"Description";

@implementation GVImageAnalizerServiceImplemenation

#pragma mark - Методы интерфейса

- (void)postImageOnServer:(UIImage *)image completionBlock:(GLAnalizeCompletionBlock)completionBlock {
    NSURLRequest *request = [self.requestSerializer requestForUploadImage:image];
    
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
