//
//  GVMainModuleInput.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol GVMainModuleInput <RamblerViperModuleInput>

/**
 @author Nikulin Maxim

 Метод инициирует стартовую конфигурацию текущего модуля
 */
- (void)configureModule;

@end
