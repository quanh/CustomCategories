//
//  UIImage+Extension.h
//  Louzhangmen
//
//  Created by Quanhai on 14/03/2018.
//  Copyright © 2018 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


+ (UIImage *)bundleImageNamed:(NSString *)imageName; /**< bundle 资源**/

+ (UIImage *)createImageWithColor:(UIColor *)color; /**< 颜色绘制纯色图片**/

+ (UIImage *)createWaterFlowImageWithColor:(UIColor *)color
                                      rect:(CGRect)rect
                                      text:(NSString *)text
                                      font:(UIFont *)textFont
                                 textColor:(UIColor *)textColor; /**< 绘制水印**/

- (UIImage *)fixOrientation; /**< 修正图片朝向**/

- (UIImage *)drawCornerRadius:(CGFloat)radius; /**< 绘制圆角**/

- (UIImage *) imageCompressForTargetSize:(CGSize)size; /**< 按比例缩放到size**/

- (UIImage *)imageCompressForTargetWidth:(CGFloat)defineWidth; /**< 指定宽度按比例缩放**/

- (UIImage *)imageCompressForTargetHeight:(CGFloat)targetHeight; /**< 指定高度按比例缩放**/

- (NSData *)compressToKB:(int)qulity; /**< 压缩质量到 xKB**/

@end
