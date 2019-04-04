//
//  LZMDataTimeAny.m
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/4/3.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import "LZMDataTimeAny.h"
#import "LZMDataAnalysis.h"


@interface LZMDataTimeAny()
@property (nonatomic, assign) int times ; /**< 次数, 默认为0 **/
@property (nonatomic, strong) NSMutableArray <NSNumber *> * timerIds ; /**< identifers **/
@property (nonatomic, strong) NSMutableDictionary * timerDic ; /**< 计时时间 **/
@end


static LZMDataTimeAny *timer = nil;
@implementation LZMDataTimeAny
+ (instancetype)sharedTimer {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        timer = [[self alloc]init];
        timer.timerIds = [NSMutableArray array];
        timer.timerDic = [NSMutableDictionary dictionary];
    });
    return timer;
}

- (void)resetTimer{
    self.times = 0;
    self.timerIds = [NSMutableArray array];
    self.timerDic = [NSMutableDictionary dictionary];
}

- (int)beginTimeEvent{
    self.times ++;
    [self.timerIds addObject:@(self.times)];
    [self.timerDic setObject:@(CACurrentMediaTime()) forKey:@(self.times)];
    return self.times;
}

- (void)beginWithSpecialTimes:(int)times{
    [self.timerIds addObject:@(times)];
    [self.timerDic setObject:@(CACurrentMediaTime()) forKey:@(times)];
}

- (void)endTimeEvent:(NSString *)event times:(int)times{
    CFTimeInterval endTimer = CACurrentMediaTime();
    CFTimeInterval startTimer = [[self.timerDic objectForKey:@(times)] doubleValue];
    int millseconds = ceil((endTimer-startTimer)*1000);
    NSLog(@"时间间隔: %d ms times: %d", millseconds, times);
    [LZMDataAnalysis timeEvent:event eventId:kUniversalEvent seconds:millseconds];
}

@end
