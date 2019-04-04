//
//  UICollectionViewCell+HZCell.h
//  Louzhangmen
//
//  Created by Quanhai on 2018/10/15.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (HZCell)



+ (void)registForCollectionView:(UICollectionView *)collectionView;
+ (instancetype)dequeueCellForTableView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath;


@end

NS_ASSUME_NONNULL_END
