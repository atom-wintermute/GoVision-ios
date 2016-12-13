//
//  GVCoreAssembly.h
//  GoVision
//
//  Created by Nikulin Maksim on 13/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

@protocol GVImageAnalizerSerializer;

@protocol GVCoreAssembly <NSObject>

- (id<GVImageAnalizerSerializer>)imageAnalizerSerializer;

@end
