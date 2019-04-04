//
//  NSString+LZMAttribute.h
//  Louzhangmen
//
//  Created by Quanhai on 2018/3/30.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

// 商品上限
#define kProductMaxNumber  999999

@interface NSString ()

- (NSString *)customPriceString ;

// 商品展示价格
- (NSMutableAttributedString *)priceAttributeString;
// 卡券直减展示价格
- (NSMutableAttributedString *)couponAmountPrice;
// 不可用卡券直减展示价格
- (NSMutableAttributedString *)couponAmountDisablePrice;
// 店铺展示的 卡券直减展示价格
- (NSMutableAttributedString *)couponShopAmountPrice;
// 卡券折扣展示价格
- (NSMutableAttributedString *)couponDiscountPrice;
// 不可用卡券折扣展示价格
- (NSMutableAttributedString *)couponDiscountDisablePrice;
// 店铺展示的 卡券折扣展示价格
- (NSMutableAttributedString *)couponShopDiscountPrice;
// z商品折扣前展示价格
- (NSMutableAttributedString *)oldPriceAttributeString;
// 扩宽的 描述字符串
- (NSMutableAttributedString *)describAttributeString ;

@end
