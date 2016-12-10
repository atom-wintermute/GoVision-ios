//
//  GLBlockHelper.h
//  GoVision
//
//  Created by Nikulin Maksim on 10/12/2016.
//  Copyright © 2016 Rambler&Co. All rights reserved.
//

#ifndef GoVision_GLBlocksHelpers_h
#define GoVision_GLBlocksHelpers_h

#define run_block(block, ...) block ? block(__VA_ARGS__) : nil
#define run_block_on_main(block, ...) if(block){\
if ([NSThread isMainThread]) {\
run_block(block, __VA_ARGS__);\
}\
else{\
dispatch_async(dispatch_get_main_queue(), ^{run_block(block,__VA_ARGS__);});\
}\
}

#define run_block_on_bg(block, ...) if(block){\
if (![NSThread isMainThread]) {\
block(__VA_ARGS__);\
}\
else{\
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{run_block(block,__VA_ARGS__);});\
}\
}

#endif
