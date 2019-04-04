//
//  NSString+convert.h
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface NSString (convert)

#pragma mark - string size

- (CGSize)sizeOfConstantWidth:(CGFloat)width font:(UIFont *)font;/**< 指定宽 计算字符串高**/
- (CGSize)sizeOfConstantHeight:(CGFloat)height font:(UIFont *)font;/**< 指定高， 计算字符串宽**/


#pragma mark - 处理异常字符串
- (NSString *)hz_absaluteString;/**< 删除空格、换行的字符串**/
- (NSString *)hz_replaceNull;/**< 防止NULL <null> nil 字符串， 总是返回一个字符串**/


#pragma mark - 特定用法扩展
/**
 价格转字符串， 注意这里的价格为 分， 展示结果为 元

 @param price 价格 分
 @return ¥元 , 小数前最少1位 小数后最多2位
 */
+ (NSString *)descriptionWithPrice:(NSUInteger)price;
+ (NSMutableAttributedString *)attributeStringWithFinalPrice:(NSUInteger)price; /**< 带¥符号的最终价格字符串**/
+ (NSMutableAttributedString *)atttributeStringWithOriginPrice:(NSUInteger)originPrice; /**< 带¥符号的原始价格字符串**/


- (NSString *)nickNameFromRealName; /**< 分别处理了 无名字、汉字名字、英文名字的情况**/

@end

NS_ASSUME_NONNULL_END
