//
//  NSString+convert.m
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import "NSString+convert.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (convert)

#pragma mark - string size

- (CGSize)sizeOfConstantWidth:(CGFloat)width font:(UIFont *)font{
    CGSize estimtSize = CGSizeMake(width, MAXFLOAT);
    CGRect rect = [self boundingRectWithSize:estimtSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName :font} context:nil];
    return rect.size;
}

- (CGSize)sizeOfConstantHeight:(CGFloat)height font:(UIFont *)font{
    CGSize estimtSize = CGSizeMake(MAXFLOAT, height);
    CGRect rect = [self boundingRectWithSize:estimtSize options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading  attributes:@{NSFontAttributeName :font} context:nil];
    return rect.size;
}

#pragma mark - 处理异常字符串
- (NSString *)hz_absaluteString{
    NSString *absString = self?self:@"";
    absString = [absString stringByReplacingOccurrencesOfString:@" " withString:@""];
    absString = [absString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    absString = [absString stringByReplacingOccurrencesOfString:@"\t" withString:@""];
    return absString;
}

- (NSString *)hz_replaceNull{
    if(self.length == 0)
        return @"";
    return self;
}

#pragma mark - 特定用法扩展
+ (NSMutableAttributedString *)attributeStringWithFinalPrice:(NSUInteger)price{
    NSString *showText = [NSString descriptionWithPrice:price];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:showText];
    [attr setAttributes:@{NSFontAttributeName: LZMFont(LZMSize(@"T6"), LZMFontName(@"F1")),
                          NSForegroundColorAttributeName : LZMColor(@"C3")} range:NSMakeRange(0, 1)];
    [attr setAttributes:@{NSForegroundColorAttributeName : LZMColor(@"C3"),//T4
                          NSFontAttributeName: LZMFont(LZMSize(@"T4"), LZMFontName(@"F2"))
                          } range:NSMakeRange(1, showText.length -1)];
    return attr;
}

+ (NSMutableAttributedString *)atttributeStringWithOriginPrice:(NSUInteger)originPrice{
    NSString *showText = [NSString descriptionWithPrice:originPrice];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:
                                       showText
                                                                             attributes:@{
                                                                                          NSForegroundColorAttributeName : LZMColor(@"C6"),
                                                                                          NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],
                                                                                          NSFontAttributeName: LZMFont(LZMSize(@"T6"), LZMFontName(@"F1"))
                                                                                          }];
    return attr;
}


+ (NSString *)descriptionWithPrice:(NSUInteger)price{
    NSNumberFormatter *formater = [[NSNumberFormatter alloc] init];
    formater.minimumIntegerDigits = 1;
    formater.maximumFractionDigits = 2;
    NSString *showText = [formater stringFromNumber:@(price/100.f)];
    showText = [NSString stringWithFormat:@"¥%@", showText];
    return showText;
}

#pragma mark - 名称显示规则

- (NSString *)nickNameFromRealName{
    NSString *realName = self;
    if (realName.length == 0){
        return @"某人";
    }
    if (realName.length <3){
        return realName;
    }
    NSString *regular = @"^[A-Za-z].+$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regular];
    if (![predicate evaluateWithObject:realName]){
        if (realName.length < 5){
            return [realName substringWithRange:NSMakeRange(realName.length-2, 2)];
        }
    }
    return [realName substringToIndex:2];
}

+ (NSString *)md5FromData:(NSData *)data{
    //不要把数据流先转成char，不然如果遇到00字节就不会计算00后面数据
    unsigned char result[16];
    CC_MD5([data bytes], (int)[data length], result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++){
        [hash appendFormat:@"%02x", result[i]];//x就是小写的字母，X就是大写的字母，2个字节不足补0
    }
    return hash;
}

@end
