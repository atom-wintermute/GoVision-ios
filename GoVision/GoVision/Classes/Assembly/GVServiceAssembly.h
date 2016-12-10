//
//  GLServiceAssembly.h
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@protocol GVImageAnalizerService;

@protocol GVServiceAssembly <NSObject>

- (id<GVImageAnalizerService>)imageAnalizerService;

@end
