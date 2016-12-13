//
//  GVCoreAssemblyImplementation.m
//  GoVision
//
//  Created by Nikulin Maksim on 13/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVCoreAssemblyImplementation.h"

#import "GVImageAnalizerSerializerImplementation.h"

@implementation GVCoreAssemblyImplementation

- (id<GVImageAnalizerSerializer>)imageAnalizerSerializer {
    return [TyphoonDefinition withClass:[GVImageAnalizerSerializerImplementation class]];
}

@end
