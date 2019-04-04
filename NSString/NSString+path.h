//
//  NSString+path.h
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (path)

#pragma mark - url encoding decode
- (NSString *)URLEncodedString; /**< 对URL 中的中文和 "|" "{" "}" 字符编码**/
- (NSString *)URLDecodedString; /**< URL 解码**/

#pragma - dir path
- (instancetype)cacheDir; /**< 缓存目录路径**/

- (instancetype)docDir; /**< 文档目录根路径**/

- (instancetype)tmpDir; /**< 临时目录根路径**/

- (NSString *)hz_absaluteString;

- (NSString *)hj_replaceEmpty;

@end

NS_ASSUME_NONNULL_END
