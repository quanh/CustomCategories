//
//  NSObject+ViewController.h
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/3/7.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ViewController)

#pragma mark - 获取控制器

/**
 获取当前控制器

 @return return value description
 */
+ (UIViewController *)getCurrentVC;

/**
 为View 绘制圆角背景

 @param sectionView view
 @param radius 圆角大小
 @param rectCorner 圆角位置
 @param leftMargin 左边距
 @param rightMargin 右边距
 @param fillColor 圆角内部填充色
 @param storkeColor 圆角外部填充色
 */
+ (void)setSectionView:(UIView *)sectionView
                  radius:(CGFloat)radius
              rectCorner:(UIRectCorner)rectCorner
              leftMargin:(CGFloat)leftMargin
             rightMargin:(CGFloat)rightMargin
               fillColor:(UIColor *)fillColor
             storkeColor:(UIColor *)storkeColor;

/**
 绘制section 内的cell s 圆角, 请在displaycell 调用

 @param radius 圆角大小
 @param tableView tableview
 @param cell 当前cell
 @param indexPath 当前indexPath
 @param section 当前section
 @param leftMargin 左边距
 @param rightMargin 右边距
 @param fillColor 圆角内不填充色
 @param storkeColor 圆角外部填充色
 @param drawHeader 是否和header 合并绘制， 设置YES 需要单独绘制header 的圆角
 @param drawFooter 是否和footer 合并绘制， 设置YES 需要单独绘制footer 的圆角
 */
+ (void)setSectionRadius:(CGFloat)radius
               tableView:(__kindof UITableView *)tableView
                    cell:(__kindof UITableViewCell *)cell
        currentIndexPath:(NSIndexPath *)indexPath
           targetSection:(NSUInteger)section
              leftMargin:(CGFloat)leftMargin
             rightMargin:(CGFloat)rightMargin
               fillColor:(UIColor *)fillColor
             storkeColor:(UIColor *)storkeColor
              drawHeader:(BOOL)drawHeader
              drawFooter:(BOOL)drawFooter;

@end

NS_ASSUME_NONNULL_END
