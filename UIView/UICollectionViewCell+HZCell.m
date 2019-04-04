//
//  UICollectionViewCell+HZCell.m
//  Louzhangmen
//
//  Created by Quanhai on 2018/10/15.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import "UICollectionViewCell+HZCell.h"

NSString *const IdentiferCollectionCellPrefix = @"hz_";

@implementation UICollectionViewCell (HZCell)

+ (void)registForCollectionView:(UICollectionView *)collectionView{
    NSString *identifer = [NSString stringWithFormat:@"%@%@", IdentiferCollectionCellPrefix, NSStringFromClass([self class])];
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:identifer];;
}

+ (instancetype)dequeueCellForTableView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath{
    NSString *identifer = [NSString stringWithFormat:@"%@%@", IdentiferCollectionCellPrefix, NSStringFromClass([self class])];
    __kindof UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifer forIndexPath:indexPath];
    
    return cell;
}

@end
