//
//  LZMBaseNavigationController+PushPop.h
//  Louzhangmen
//
//  Created by Quanhai on 2018/9/20.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (PushPop)

#pragma mark - push pop 动画结束的回调方法completion
- (void)pushController:(UIViewController *)viewController
              animated:(BOOL)animated
            completion:(void (^)(void))completion;

- (void)popControllerAnimated:(BOOL)animated
           completion:(void (^)(void))completion;

- (void)popToRootControllerAnimated:(BOOL)animated
                 completion:(void (^)(void))completion;


@end

NS_ASSUME_NONNULL_END
