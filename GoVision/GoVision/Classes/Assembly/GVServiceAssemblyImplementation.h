//
//  GVServiceAssemblyImplementation.h
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

#import "GVServiceAssembly.h"

@interface GVServiceAssemblyImplementation : TyphoonAssembly <GVServiceAssembly, RamblerInitialAssembly>

@end
