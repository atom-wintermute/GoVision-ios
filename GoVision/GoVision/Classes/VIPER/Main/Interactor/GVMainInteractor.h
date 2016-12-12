//
//  GVMainInteractor.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import "GVMainInteractorInput.h"

@protocol GVMainInteractorOutput;
@protocol GVImageAnalizerService;;

@interface GVMainInteractor : NSObject <GVMainInteractorInput>

@property (nonatomic, weak) id<GVMainInteractorOutput> output;
@property (nonatomic, strong) id<GVImageAnalizerService> imageAnalizerService;

@end
