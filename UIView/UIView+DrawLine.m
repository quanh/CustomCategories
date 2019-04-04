//
//  UIView+DrawLine.m
//  Louzhangmen
//
//  Created by Quanhai on 2018/7/23.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import "UIView+DrawLine.h"

@implementation UIView (DrawLine)

- (void)drawVerturaStrokeLineWithLineLength:(CGFloat)length
                                lineSpacing:(CGFloat)spacing
                                  lineColor:(UIColor *)color {
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    [shapLayer setFrame:self.bounds];
    //    [shapLayer setPosition:CGPointMake(self.bounds.size.width/2, self.bounds.size.height)];
    [shapLayer setFillColor:[UIColor clearColor].CGColor];
    [shapLayer setStrokeColor:color.CGColor];
    [shapLayer setLineWidth:self.bounds.size.width];
    //    [shapLayer setLineJoin:kCALineJoinBevel];
    [shapLayer setLineDashPattern:@[@(length), @(spacing)]];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 0, self.bounds.size.height);
    
    [shapLayer setPath:path];
    CGPathRelease(path);
    [self.layer addSublayer:shapLayer];
}

- (void)drawHorizenStrokeLineWithLineLength:(CGFloat)length
                                lineSpacing:(CGFloat)spacing
                                  lineColor:(UIColor *)color{
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    [shapLayer setFrame:self.bounds];
    [shapLayer setFillColor:[UIColor clearColor].CGColor];
    [shapLayer setStrokeColor:color.CGColor];
    [shapLayer setLineWidth:1.f];
    [shapLayer setLineDashPattern:@[@(length), @(spacing)]];
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, self.bounds.size.height/2);
    CGPathAddLineToPoint(path, NULL, self.bounds.size.width, self.bounds.size.height/2);
    
    [shapLayer setPath:path];
    CGPathRelease(path);
    [self.layer addSublayer:shapLayer];
}

@end
