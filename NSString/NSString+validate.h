//
//  NSString+validate.h
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (validate)

- (BOOL)isIdentityCard; /**< 是否是身份证号**/
- (BOOL)isBroadPhoneNum; /**< 宽泛的验证手机号, 11位+ 非 10* 11* 12*号码 **/
- (BOOL)isEmoji; /**< 是否是emoji**/
- (BOOL)containsEmoji; /**< 是否包含emoji**/
- (BOOL)isChineseString;

@end

NS_ASSUME_NONNULL_END
