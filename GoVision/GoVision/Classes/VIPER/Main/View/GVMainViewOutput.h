//
//  GVMainViewOutput.h
//  GoVision
//
//  Created by Nikulin Maxim on 09/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GVMainViewOutput <NSObject>

/**
 @author Nikulin Maxim

 Метод сообщает презентеру о том, что view готова к работе
 */
- (void)didTriggerViewReadyEvent;

- (void)didTriggerCameraButtonPressedEvent;

@end
