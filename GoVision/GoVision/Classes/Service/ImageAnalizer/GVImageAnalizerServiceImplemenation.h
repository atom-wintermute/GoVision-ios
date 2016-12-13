//
//  GVImageAnalizerServiceImplemenation.h
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GVImageAnalizerService.h"

@protocol GVImageAnalizerSerializer;

@interface GVImageAnalizerServiceImplemenation : NSObject <GVImageAnalizerService>

@property (nonatomic, strong) id<GVImageAnalizerSerializer> requestSerializer;

@end
