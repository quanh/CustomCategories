//
//  LZMBaseNavigationController+PushPop.m
//  Louzhangmen
//
//  Created by Quanhai on 2018/9/20.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import "UINavigationController+PushPop.h"

@implementation UINavigationController (PushPop)

#pragma mark - 自定义push pop
- (void)pushController:(UIViewController *)viewController
              animated:(BOOL)animated
            completion:(void (^)(void))completion{
    [CATransaction setCompletionBlock:completion];
    [CATransaction begin];
    [self pushViewController:viewController animated:animated];
    [CATransaction commit];
}

- (void)popControllerAnimated:(BOOL)animated
           completion:(void (^)(void))completion{
    [CATransaction setCompletionBlock:completion];
    [CATransaction begin];
    [self popViewControllerAnimated:animated];
    [CATransaction commit];
}

- (void)popToRootControllerAnimated:(BOOL)animated
                 completion:(void (^)(void))completion{
    [CATransaction setCompletionBlock:completion];
    [CATransaction begin];
    [self popToRootViewControllerAnimated:animated];
    [CATransaction commit];
}

@end
