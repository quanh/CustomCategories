//
//  NSDate+time.h
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (time)

- (NSString *)time_ymdhms; /**< yyyy-mm-dd hh:mm:ss**/
- (NSString *)time_ymdhm; /**< yyyy-mm-dd hh:mm**/
- (NSString *)time_ymd; /**< yyyy-mm-dd**/
- (NSString *)timeToYMD; /**< yy年mm月dd日**/
- (NSString *)timeToMD; /**< mm月dd日**/
- (NSString *)timeHour; /**< hh**/
- (NSString *)time_YMD; /**< yyyyMMdd**/

- (NSDate *)nextWeekend:(NSInteger)days; /**< day天后的周末**/
- (NSDate *)nextWeekdaysWithDay:(NSInteger)day; /**< day天后的工作日**/

#pragma mark - 计算date N月后的日期
- (NSDate *)dateAfterGgapMonth:(NSInteger)gapMonthCount ;

#pragma mark - custom
- (NSString *)weekday; /**< 周x **/
- (NSString *)meetingRoomTime; /**< mm月dd日（周x）**/
- (NSString *)hzAutoDate; /**< 刚刚/ x分钟前 /x小时前 /x天前 ... **/

@end

NS_ASSUME_NONNULL_END
