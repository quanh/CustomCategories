//
//  YYAnimatedImageView+hzImage.m
//  lzm-repos
//
//  Created by Quanhai on 2019/1/23.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import "YYAnimatedImageView+hzImage.h"
#import "YYImage.h"
#import "YYAnimatedImageView.h"
#import <objc/runtime.h>


@implementation YYAnimatedImageView (hzImage)
@dynamic hzImage;

- (void)setHzImage:(NSString *)hzImage{
    objc_setAssociatedObject(self, @selector(hzImage), hzImage, OBJC_ASSOCIATION_COPY);
    
    if ([hzImage hasPrefix:@"http"]){
        self.imageURL = [NSURL URLWithString:hzImage];
    }else{
        YYImage *image = [YYImage imageNamed:hzImage];
        if (!image){
            image = (YYImage *)[UIImage imageNamed:hzImage];
        }
        self.image = image;
    }
}

- (NSString *)hzImage{
    return objc_getAssociatedObject(self, @selector(hzImage));
}


- (void)setHzImageUrl:(NSString *)hzImageUrl placeholder:(UIImage *)placeholderImage{
    objc_setAssociatedObject(self, @selector(hzImage), hzImageUrl, OBJC_ASSOCIATION_COPY);
    
    if ([hzImageUrl hasPrefix:@"http"]){
        [self setImageWithURL:[NSURL URLWithString:hzImageUrl] placeholder:placeholderImage];
    }else{
        self.image = placeholderImage;
    }
}

- (void)setHzImageUrl:(NSString *)hzImageUrl placeholder:(UIImage *)placeholderImage completion:(YYWebImageCompletionBlock)completion{
    objc_setAssociatedObject(self, @selector(hzImage), hzImageUrl, OBJC_ASSOCIATION_COPY);
    
    if ([hzImageUrl hasPrefix:@"http"]){
        [self setImageWithURL:[NSURL URLWithString:hzImageUrl] placeholder:placeholderImage options:YYWebImageOptionRefreshImageCache|YYWebImageOptionSetImageWithFadeAnimation|YYWebImageOptionAllowBackgroundTask completion:completion];
    }else{
       NSLog(NO, @"%@ is not an integral url", hzImageUrl);
    }
}



@end
