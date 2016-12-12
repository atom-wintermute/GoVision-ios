//
//  GVMainAssembly.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol GVServiceAssembly;

/**
 @author Nikulin Maxim

 Main module
 */
@interface GVMainAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property (nonatomic, strong, readonly) TyphoonAssembly<GVServiceAssembly> *serviceAssembly;

@end
