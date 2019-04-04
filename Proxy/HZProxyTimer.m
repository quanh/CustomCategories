//
//  HZProxyTimer.m
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/4/1.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import "HZProxyTimer.h"

@interface HZProxy : NSProxy
@property (weak, nonatomic) id target;
@end
@implementation HZProxy
+ (instancetype)proxyWithTarget:(id)target{
    HZProxy *proxy = [HZProxy alloc];
    proxy.target = target;
    return proxy;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

@end

@implementation HZProxyTimer

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)second
                                     target:(id)aTarget
                                   selector:(SEL)aSelector
                                   userInfo:(nullable id)userInfo
                                    repeats:(BOOL)repeats{
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:second target:[HZProxy proxyWithTarget: aTarget] selector:aSelector userInfo:userInfo repeats:repeats];
    return timer;
}

@end
