//
//  GVMainPresenter.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVMainViewOutput.h"
#import "GVMainInteractorOutput.h"
#import "GVMainModuleInput.h"

@protocol GVMainViewInput;
@protocol GVMainInteractorInput;
@protocol GVMainRouterInput;

@interface GVMainPresenter : NSObject <GVMainModuleInput, GVMainViewOutput, GVMainInteractorOutput, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, weak) id<GVMainViewInput> view;
@property (nonatomic, strong) id<GVMainInteractorInput> interactor;
@property (nonatomic, strong) id<GVMainRouterInput> router;

@end
