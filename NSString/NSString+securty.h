//
//  NSString+securty.h
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (securty)

#pragma mark - hash
- (NSString *)md5String;
- (NSString *)sha1String;
- (NSString *)sha256String;
- (NSString *)sha512String;
- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

- (NSString *)base64Encode;

@end

NS_ASSUME_NONNULL_END
