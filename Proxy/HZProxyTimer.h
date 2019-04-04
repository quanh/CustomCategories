//
//  HZProxyTimer.h
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/4/1.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HZProxyTimer : NSProxy


/**
 NSTimer 初始化方法, 这里使用非系统的初始化方法是为了避免 循环引用

 @param second 间隔执行时间 秒
 @param aTarget 响应对象
 @param aSelector 响应方法
 @param userInfo 携带信息
 @param repeats 是否循环
 @return return value description
 */
+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)second
                                     target:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(nullable id)userInfo
                                    repeats:(BOOL)repeats;

@end

NS_ASSUME_NONNULL_END
