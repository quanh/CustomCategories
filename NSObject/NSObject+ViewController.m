//
//  NSObject+ViewController.m
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/3/7.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import "NSObject+ViewController.h"
#import <UIKit/UIKit.h>

@implementation NSObject (ViewController)

#pragma mark - 获取控制器
+ (UIViewController *)getCurrentVC {
    UIViewController* currentViewController = [UIApplication sharedApplication].delegate.window.rootViewController;
    BOOL runLoopFind = YES;
    while (runLoopFind) {
        if (currentViewController.presentedViewController) {
            currentViewController = currentViewController.presentedViewController;
            if ([currentViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController* navigationController = (UINavigationController* )currentViewController;
                currentViewController = [navigationController.childViewControllers lastObject];
                return currentViewController;
            }
            return currentViewController;
        }
        if ([currentViewController isKindOfClass:[UINavigationController class]]) {
            UINavigationController* navigationController = (UINavigationController* )currentViewController;
            currentViewController = [navigationController.childViewControllers lastObject];
            return currentViewController;
        }
        if ([currentViewController isKindOfClass:[UITabBarController class]]) {
            UITabBarController* tabBarController = (UITabBarController* )currentViewController;
            currentViewController = tabBarController.selectedViewController;
            if ([currentViewController isKindOfClass:[UINavigationController class]]) {
                UINavigationController* navigationController = (UINavigationController* )currentViewController;
                currentViewController = [navigationController.childViewControllers lastObject];
                return currentViewController;
            }
            return currentViewController;
        }else{
            NSUInteger childViewControllerCount = currentViewController.childViewControllers.count;
            if (childViewControllerCount > 0) {
                currentViewController = currentViewController.childViewControllers.lastObject;
                return currentViewController;
            } else {
                return currentViewController;
            }
        }
    }
    return currentViewController;
}





+ (void)cornerTableViewSection:(UITableViewCell *)cell
                    tableView:(UITableView *)tableView
                    indexPath:(NSIndexPath *)indexPath
                      bgColor:(UIColor *)bgColor
                 cornerRadius:(CGFloat)radius
                        width:(CGFloat)width
{
    // 圆角弧度半径
    CGFloat cornerRadius = 0.f;
    if (radius == 0) {
        cornerRadius = 4.f;
    }else{
        cornerRadius = radius;
    }
    
    // 设置cell的背景色为透明，如果不设置这个的话，则原来的背景色不会被覆盖
    cell.backgroundColor = UIColor.clearColor;
    
    // 创建一个shapeLayer
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    CAShapeLayer *backgroundLayer = [[CAShapeLayer alloc] init]; //显示选中
    // 创建一个可变的图像Path句柄，该路径用于保存绘图信息
    CGMutablePathRef pathRef = CGPathCreateMutable();
    // 获取cell的size
    // 第一个参数,是整个 cell 的 bounds, 第二个参数是距左右两端的距离,第三个参数是距上下两端的距离
    CGRect bounds;
    if (width != 0) {
        bounds = CGRectInset(cell.bounds, 10, 0);
    }else{
        bounds = CGRectInset(cell.bounds, width, 0);
    }
    
    // 这里要判断分组列表中的第一行，每组section的第一行，每组section的中间行
    // CGPathAddRoundedRect(pathRef, nil, bounds, cornerRadius, cornerRadius);
    
    if ([tableView numberOfRowsInSection:indexPath.section]-1 == 0) {
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMinX(bounds), CGRectGetMidY(bounds), cornerRadius);
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
    }else if (indexPath.row == 0) {
        // 初始起点为cell的左下角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds));
        // 起始坐标为左下角，设为p，（CGRectGetMinX(bounds), CGRectGetMinY(bounds)）为左上角的点，设为p1(x1,y1)，(CGRectGetMidX(bounds), CGRectGetMinY(bounds))为顶部中点的点，设为p2(x2,y2)。然后连接p1和p2为一条直线l1，连接初始点p到p1成一条直线l，则在两条直线相交处绘制弧度为r的圆角。
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds), CGRectGetMidX(bounds), CGRectGetMinY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 终点坐标为右下角坐标点，把绘图信息都放到路径中去,根据这些路径就构成了一块区域了
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds));
    } else if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
        // 初始起点为cell的左上角坐标
        CGPathMoveToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMinY(bounds));
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMidX(bounds), CGRectGetMaxY(bounds), cornerRadius);
        CGPathAddArcToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds), CGRectGetMidY(bounds), cornerRadius);
        // 添加一条直线，终点坐标为右下角坐标点并放到路径中去
        CGPathAddLineToPoint(pathRef, nil, CGRectGetMaxX(bounds), CGRectGetMinY(bounds));
    } else {
        // 添加cell的rectangle信息到path中（不包括圆角）
        CGPathAddRect(pathRef, nil, bounds);
    }
    // 把已经绘制好的可变图像路径赋值给图层，然后图层根据这图像path进行图像渲染render
    layer.path = pathRef;
    backgroundLayer.path = pathRef;
    // 注意：但凡通过Quartz2D中带有creat/copy/retain方法创建出来的值都必须要释放
    CFRelease(pathRef);
    // 按照shape layer的path填充颜色，类似于渲染render
    // layer.fillColor = [UIColor colorWithWhite:1.f alpha:0.8f].CGColor;
    layer.fillColor = bgColor.CGColor;
    
    // view大小与cell一致
    UIView *roundView = [[UIView alloc] initWithFrame:bounds];
    // 添加自定义圆角后的图层到roundView中
    [roundView.layer insertSublayer:layer atIndex:0];
    roundView.backgroundColor = UIColor.clearColor;
    // cell的背景view
    cell.backgroundView = roundView;
}

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
              drawFooter:(BOOL)drawFooter{
    if (indexPath.section == section) {
        //圆率
        CGFloat cornerRadius = radius;
        //大小
        CGRect bounds = CGRectMake(leftMargin, 0, cell.bounds.size.width-leftMargin-rightMargin, cell.bounds.size.height+1.f);
        //行数
        NSInteger numberOfRows = [tableView numberOfRowsInSection:indexPath.section];
        
        //绘制曲线
        UIBezierPath *bezierPath = nil;
        if (indexPath.row == 0 && numberOfRows == 1) {
            //一个为一组时,四个角都为圆角
            if (!drawHeader){
                if (!drawFooter){
                    bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
                }else{
                    bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
                }
            }else{
                if (!drawFooter){
                    bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
                }else{
                    bezierPath = [UIBezierPath bezierPathWithRect:bounds];
                }
            }
            
        } else if (indexPath.row == 0) {
            //为组的第一行时,左上、右上角为圆角
            if (!drawHeader){
                bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            }else{
                bezierPath = [UIBezierPath bezierPathWithRect:bounds];
            }
        } else if (indexPath.row == numberOfRows - 1) {
            //为组的最后一行,左下、右下角为圆角
            if (!drawFooter){
                bezierPath = [UIBezierPath bezierPathWithRoundedRect:bounds byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
            }else{
                bezierPath = [UIBezierPath bezierPathWithRect:bounds];
            }
        } else {
            //中间的都为矩形
            bezierPath = [UIBezierPath bezierPathWithRect:bounds];
        }
        //cell的背景色透明
//        cell.backgroundColor = [UIColor clearColor];
        //新建一个图层
        CAShapeLayer *layer = [CAShapeLayer layer];
        //图层边框路径
        layer.path = bezierPath.CGPath;
        //图层填充色,也就是cell的底色
        layer.fillColor = fillColor.CGColor;
        //图层边框线条颜色
        cell.backgroundColor = storkeColor;
        //将图层添加到cell的图层中,并插到最底层
        [cell.layer insertSublayer:layer atIndex:0];
    }
}

+ (void)setSectionView:(UIView *)sectionView
                  radius:(CGFloat)radius
                    rectCorner:(UIRectCorner)rectCorner
                    leftMargin:(CGFloat)leftMargin
                   rightMargin:(CGFloat)rightMargin
                     fillColor:(UIColor *)fillColor
                   storkeColor:(UIColor *)storkeColor{
    CGRect rect = CGRectMake(leftMargin, 0, sectionView.bounds.size.width-leftMargin-rightMargin, sectionView.bounds.size.height +1);
    UIBezierPath *headerPath = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path = headerPath.CGPath;
    layer.fillColor = fillColor.CGColor;
    sectionView.backgroundColor = storkeColor;
    [sectionView.layer insertSublayer:layer atIndex:0];
}


@end
