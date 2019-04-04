//
//  NSString+LZMAttribute.m
//  Louzhangmen
//
//  Created by Quanhai on 2018/3/30.
//  Copyright © 2018年 Shenzhen Zhongzheng Information Technology Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>


@implementation NSString (LZMAttribute)

- (NSString *)customPriceString{
    if ([self floatValue] == 0){
        return @"0";
    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.minimumFractionDigits = 2;
    formater.maximumFractionDigits = 2;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    //    showText = [NSString stringWithFormat:@"¥%@", showText];
    return showText;
}

- (NSMutableAttributedString *)priceAttributeString{
    //    if ([self floatValue] == 0){
    //        return [[NSMutableAttributedString alloc] initWithString:@""];
    //    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.minimumFractionDigits = 2;
    formater.maximumFractionDigits = 2;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    showText = [NSString stringWithFormat:@"¥%@", showText];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr setAttributes:@{NSFontAttributeName: LZMFontMedium10,
                          NSForegroundColorAttributeName : LZMColor(@"C3")} range:NSMakeRange(0, 1)];
    [attr setAttributes:@{NSForegroundColorAttributeName : LZMColor(@"C3"),
                          NSFontAttributeName: LZMFontMedium14
                          } range:NSMakeRange(1, showText.length -1)];
    return attr;
}

- (NSMutableAttributedString *)couponAmountPrice{
    //    if ([self floatValue] == 0){
    //        return [[NSMutableAttributedString alloc] initWithString:@""];
    //    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.maximumFractionDigits = 2;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    showText = [NSString stringWithFormat:@"¥%@", showText];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr setAttributes:@{NSFontAttributeName: LZMFont12,
                          NSForegroundColorAttributeName : LZMColor(@"C3")} range:NSMakeRange(0, 1)];
    [attr setAttributes:@{NSForegroundColorAttributeName : LZMColor(@"C3"),
                          NSFontAttributeName: [UIFont boldSystemFontOfSize:32*LZMWIDTH_SCALE]
                          } range:NSMakeRange(1, showText.length -1)];
    return attr;
}

- (NSMutableAttributedString *)couponAmountDisablePrice{
    //    if ([self floatValue] == 0){
    //        return [[NSMutableAttributedString alloc] initWithString:@""];
    //    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.maximumFractionDigits = 2;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    showText = [NSString stringWithFormat:@"¥%@", showText];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr setAttributes:@{NSFontAttributeName: LZMFont12,
                          NSForegroundColorAttributeName : LZMColor(@"C7")} range:NSMakeRange(0, 1)];
    [attr setAttributes:@{NSForegroundColorAttributeName : LZMColor(@"C7"),
                          NSFontAttributeName: [UIFont boldSystemFontOfSize:32*LZMWIDTH_SCALE]
                          } range:NSMakeRange(1, showText.length -1)];
    return attr;
}

- (NSMutableAttributedString *)couponShopAmountPrice{
    //    if ([self floatValue] == 0){
    //        return [[NSMutableAttributedString alloc] initWithString:@""];
    //    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.maximumFractionDigits = 2;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    showText = [NSString stringWithFormat:@"¥%@", showText];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr setAttributes:@{NSFontAttributeName: LZMFont10,
                          NSForegroundColorAttributeName : [UIColor whiteColor]} range:NSMakeRange(0, 1)];
    [attr setAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                          NSFontAttributeName: LZMFont18
                          } range:NSMakeRange(1, showText.length -1)];
    return attr;
}

- (NSMutableAttributedString *)couponDiscountPrice{
    //    if ([self floatValue] == 0){
    //        return [[NSMutableAttributedString alloc] initWithString:@""];
    //    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.maximumFractionDigits = 1;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    showText = [NSString stringWithFormat:@"%@折", showText];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:32*LZMWIDTH_SCALE],
                          NSForegroundColorAttributeName : LZMColor(@"C3")}
                  range:NSMakeRange(0, showText.length -1)];
    [attr setAttributes:@{NSForegroundColorAttributeName : LZMColor(@"C3"),
                          NSFontAttributeName: LZMFont12
                          } range:NSMakeRange(showText.length -1, 1)];
    return attr;
}

- (NSMutableAttributedString *)couponDiscountDisablePrice{
    //    if ([self floatValue] == 0){
    //        return [[NSMutableAttributedString alloc] initWithString:@""];
    //    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.maximumFractionDigits = 1;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    showText = [NSString stringWithFormat:@"%@折", showText];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:32*LZMWIDTH_SCALE],
                          NSForegroundColorAttributeName : LZMColor(@"C7")}
                  range:NSMakeRange(0, showText.length -1)];
    [attr setAttributes:@{NSForegroundColorAttributeName : LZMColor(@"C7"),
                          NSFontAttributeName: LZMFontMedium12
                          } range:NSMakeRange(showText.length -1, 1)];
    return attr;
}

- (NSMutableAttributedString *)couponShopDiscountPrice{
    //    if ([self floatValue] == 0){
    //        return [[NSMutableAttributedString alloc] initWithString:@""];
    //    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.maximumFractionDigits = 1;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    showText = [NSString stringWithFormat:@"%@折", showText];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr setAttributes:@{NSFontAttributeName: LZMFont10,
                          NSForegroundColorAttributeName : [UIColor whiteColor]}
                  range:NSMakeRange(showText.length -1, 1)];
    [attr setAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor],
                          NSFontAttributeName: LZMFontMedium18
                          } range:NSMakeRange(0, showText.length -1)];
    return attr;
}


- (NSMutableAttributedString *)oldPriceAttributeString{
    
    //    if ([self floatValue] == 0){
    //        return [[NSMutableAttributedString alloc] initWithString:@""];
    //    }
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.minimumFractionDigits = 2;
    formater.maximumFractionDigits = 2;
    NSString *showText = [formater stringFromNumber:@(self.doubleValue)];
    showText = [NSString stringWithFormat:@"¥%@", showText];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:
                                       showText
                                                                             attributes:@{
                                                                                          NSForegroundColorAttributeName : LZMColor(@"C6"),
                                                                                          NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],
                                                                                          NSFontAttributeName: LZMFont10
                                                                                          }];
    return attr;
}


- (NSMutableAttributedString *)describAttributeString{
    if (self.hz_absaluteString.length == 0){
        return [[NSMutableAttributedString alloc] initWithString:@""];
    }
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineSpacing = 3.f;
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:
                                       self
                                                                             attributes:@{
                                                                                          NSForegroundColorAttributeName : LZMColor(@"C4"),
                                                                                          NSKernAttributeName: @(1.5),
                                                                                          NSParagraphStyleAttributeName: paragraph,
                                                                                          NSFontAttributeName: LZMFont14
                                                                                          }];
    
    return attr;
}



@end
