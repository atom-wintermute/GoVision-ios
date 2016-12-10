//
//  GVMainInteractor.m
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVMainInteractor.h"

#import "GVMainInteractorOutput.h"
#import "GVImageAnalizerService.h"

@implementation GVMainInteractor

#pragma mark - Методы GVMainInteractorInput

- (void)postImageOnServer:(UIImage *)image {
    [self.imageAnalizerService postImageOnServer:image
                                 completionBlock:^(NSError *error, GLAnalizeResult result) {
                                     [self.output updateScreenWithResult:result];
                                 }];
}

- (void)postImageURLOnServer:(NSURL *)imageURL {
//    [self.imageAnalizerService postImageURLOnServer:imageURL];
}

@end
