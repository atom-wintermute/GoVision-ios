//
//  GVMainAssembly.m
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVMainAssembly.h"

#import "GVMainViewController.h"
#import "GVMainInteractor.h"
#import "GVMainPresenter.h"
#import "GVMainRouter.h"

#import "GVServiceAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation GVMainAssembly

- (GVMainViewController *)viewMain {
    return [TyphoonDefinition withClass:[GVMainViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterMain]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterMain]];
                          }];
}

- (GVMainInteractor *)interactorMain {
    return [TyphoonDefinition withClass:[GVMainInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterMain]];
                              [definition injectProperty:@selector(imageAnalizerService)
                                                    with:[self.serviceAssembly imageAnalizerService]];
                          }];
}

- (GVMainPresenter *)presenterMain{
    return [TyphoonDefinition withClass:[GVMainPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewMain]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorMain]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerMain]];
                          }];
}

- (GVMainRouter *)routerMain {
    return [TyphoonDefinition withClass:[GVMainRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewMain]];
                              [definition injectProperty:@selector(imagePickerDelegate)
                                                    with:[self presenterMain]];
                          }];
}

@end
