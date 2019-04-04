//
//  YYAnimatedImageView+hzImage.h
//  lzm-repos
//
//  Created by Quanhai on 2019/1/23.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import "YYAnimatedImageView.h"
#import "YYKit.h"
#import "UIImageView+YYWebImage.h"

NS_ASSUME_NONNULL_BEGIN

@interface YYAnimatedImageView (hzImage)


@property (nonatomic, copy) NSString *hzImage ; /**< 可以是http地址 、bundle资源(a.png/ .gif) 、assets 图片(a /b) **/


/**
 设置网络图片的URL

 @param hzImageUrl 网络图片URL string
 @param placeholderImage 占位图
 */
- (void)setHzImageUrl:(NSString *)hzImageUrl placeholder:(UIImage *)placeholderImage;

/**
 设置网络图片的url

 @param hzImageUrl 网络图片URL string
 @param placeholderImage 占位图
 @param completion 完成后的回调block
 */
- (void)setHzImageUrl:(NSString *)hzImageUrl placeholder:(UIImage *)placeholderImage completion:(YYWebImageCompletionBlock)completion;

/**
  设置网络图片URL ， 设置targetSize 以压缩大图片

 @return return value description
 */
- (void)setHzImageUrl:(NSString *)hzImageUrl
           targetSize:(CGSize)targetSize
          placeholder:(UIImage *)placeholderImage
           completion:(YYWebImageCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
