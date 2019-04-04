//
//  NSString+time.h
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (time)

// yyyy-MM-dd-HH-mm
+ (NSString *)getCurrentTime;

+ (NSString *)getCurrentParkingTime;
/** string */
- (NSString *)time_ymdhms; /**< yyyy-MM-dd HH:mm:ss**/
- (NSString *)time_ymdhm; /**< yyyy-MM-dd HH:mm**/
- (NSString *)time_ymd; /**< yyyy-MM-dd**/
- (NSString *)timeToYMD; /**< yyyy年MM月dd日**/
- (NSString *)timeToDHM; /**< dd天hh小时mm分钟**/
- (NSString *)time_md_hm; /**< MM-dd\nHH:mm **/

- (NSString *)lzmYMDHMDate;
// 年月日 -- - -
- (NSString *)lzmRoomDate;
// 时间戳转字符串
- (NSString *)lzmDate;
// 2018-08-06  --- 》 x 月 x 日
- (NSString *)lzmRoomValidateDate ;
// 卡券专用
- (NSString *)lzmCouponDate;
// 带 星期
+ (NSString *)lzmRoomDateWithDate:(NSDate *)date;
/** data */
+ (NSString *)lzm_uploadDate:(NSDate *)date;

// m名字
- (NSString *)nameFromRealName;

@end

NS_ASSUME_NONNULL_END
