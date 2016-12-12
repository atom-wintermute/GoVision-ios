//
//  GVMainRouter.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GVMainRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface GVMainRouter : NSObject <GVMainRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;
@property (nonatomic, weak) id<UINavigationControllerDelegate, UIImagePickerControllerDelegate> imagePickerDelegate;

@end
