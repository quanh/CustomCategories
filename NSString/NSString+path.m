//
//  NSString+path.m
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import "NSString+path.h"

@implementation NSString (path)

- (NSString *)URLEncodedString{
    return [self chineseCharsEncode];
}
- (NSString *)URLDecodedString{
    NSString *result = [(NSString *)self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    return [result stringByRemovingPercentEncoding];
}

- (NSString *)chineseCharsEncode{
    NSMutableArray *rangeArray = [NSMutableArray array];
    for(int i = 0; i< [self length] ; i++){
        unichar a = [self characterAtIndex:i];
        NSString *charString = [self substringWithRange:NSMakeRange(i, 1)];
        if( (a >= 0x4e00 && a <= 0x9fff) || [charString isEqualToString:@"|"] || [charString isEqualToString:@"{"] || [charString isEqualToString:@"}"]){ //判断是否为中文
            NSString *encodeString = [charString URL_Encoded_String];
            [rangeArray addObject:encodeString];
        }else{
            [rangeArray addObject:charString];
        }
    }
    return [rangeArray componentsJoinedByString:@""];
}

- (NSString *)URL_Encoded_String{
    NSString *unencodedString = self;
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)unencodedString,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    
    return encodedString;
}

#pragma mark - path
- (instancetype)cacheDir{
    NSString *cachdir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [cachdir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)docDir{
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [docDir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (instancetype)tmpDir{
    NSString *tmpDir = NSTemporaryDirectory();
    return [tmpDir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (NSString *)hz_absaluteString{
    NSString *absString = self?self:@"";
    absString = [absString stringByReplacingOccurrencesOfString:@" " withString:@""];
    absString = [absString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return absString;
}

- (NSString *)hj_replaceEmpty{
    NSString *newString = nil;
    newString = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    newString = [newString stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    return newString;
}


@end
