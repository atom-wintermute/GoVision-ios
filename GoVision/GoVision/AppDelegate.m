//
//  AppDelegate.m
//  GoVision
//
//  Created by Nikulin Maksim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "AppDelegate.h"

#import <RamblerTyphoonUtils/AssemblyCollector.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

#pragma mark - Вспомогательные методы

- (NSArray *)initialAssemblies {
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    NSArray *initialAssemblies = [collector collectInitialAssemblyClasses];
    return initialAssemblies;
}

@end
