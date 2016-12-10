//
//  GVMainInteractorInput.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol GVMainInteractorInput <NSObject>

- (void)postImageOnServer:(UIImage *)image;

- (void)postImageURLOnServer:(NSURL *)imageURL;

@end
