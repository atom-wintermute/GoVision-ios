//
//  GVMainInteractorOutput.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "GVImageAnalizerService.h"

@protocol GVMainInteractorOutput <NSObject>

- (void)updateScreenWithResult:(GLAnalizeResult)result;

@end
