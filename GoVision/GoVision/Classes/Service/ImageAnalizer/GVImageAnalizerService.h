//
//  GVImageAnalizerService.h
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, GLAnalizeResult) {
    GLAnalizeResultUnknown,
    GLAnalizeResultVeryLikely,
    GLAnalizeResultLikely,
    GLAnalizeResultPossible,
    GLAnalizeResultUnlikely,
    GLAnalizeResultVeryUnlikely,
};

typedef void (^GLAnalizeCompletionBlock)(NSError *error, GLAnalizeResult result);

@protocol GVImageAnalizerService <NSObject>

- (void)postImageOnServer:(UIImage *)image
          completionBlock:(GLAnalizeCompletionBlock)completionBlock;

@end
