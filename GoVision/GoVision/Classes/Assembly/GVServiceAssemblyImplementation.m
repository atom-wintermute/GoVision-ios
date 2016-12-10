//
//  GVServiceAssemblyImplementation.m
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVServiceAssemblyImplementation.h"

#import "TyphoonDefinition+Infrastructure.h"
#import "TyphoonConfigPostProcessor.h"

#import "GVImageAnalizerServiceImplemenation.h"

@implementation GVServiceAssemblyImplementation

- (id<GVImageAnalizerService>)imageAnalizerService {
    return [TyphoonDefinition withClass:[GVImageAnalizerServiceImplemenation class]];
}

@end
