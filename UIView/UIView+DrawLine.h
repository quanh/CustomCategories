//
//  UIView+DrawLine.h
//  Louzhangmen
//
//  Created by Quanhai on 2018/7/23.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (DrawLine)


// 竖向靠左边虚线
- (void)drawVerturaStrokeLineWithLineLength:(CGFloat)length
                                lineSpacing:(CGFloat)spacing
                                  lineColor:(UIColor *)color;
// 横向居中虚线
- (void)drawHorizenStrokeLineWithLineLength:(CGFloat)length
                                lineSpacing:(CGFloat)spacing
                                  lineColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
