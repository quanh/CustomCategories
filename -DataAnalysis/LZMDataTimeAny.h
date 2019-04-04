//
//  LZMDataTimeAny.h
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/4/3.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LZMDataTimeAny : NSObject

+ (instancetype)sharedTimer;

- (void)resetTimer;

- (int)beginTimeEvent;
- (void)beginWithSpecialTimes:(int)times;

- (void)endTimeEvent:(NSString *)event times:(int)times;

@end

NS_ASSUME_NONNULL_END
