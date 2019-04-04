//
//  NSString+time.m
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import "NSString+time.h"

@implementation NSString (time)

+ (NSString *)getCurrentTime{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd-HH-mm";
    
    return [formatter stringFromDate:date];
}

+ (NSString *)getCurrentParkingTime{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    return [formatter stringFromDate:date];
}

- (NSString *)time_ymdhms{
//    NSAssert((self.length != 10), @"time length is not 10.");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.longLongValue];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)time_ymdhm{
//    NSAssert((self.length != 10), @"time length is not 10.");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.longLongValue];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)time_ymd{
//    NSAssert((self.length != 10), @"time length is not 10.");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.longLongValue];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)timeToYMD{
//    NSAssert((self.length != 10), @"time length is not 10.");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy年MM月dd日";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.longLongValue];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)timeToDHM{
//    NSAssert((self.length != 10), @"time length is not 10.");
    NSInteger day = [self longLongValue]/(60*24);
    NSInteger hours = ([self longLongValue] - day*60*24)/60;
    NSInteger minutie = [self longLongValue] - day*60*24 - hours*60;
    
    NSString *time = @"";
    if (day != 0){
        time = [time stringByAppendingString:[NSString stringWithFormat:@"%ld天", day]];
    }
    if (hours != 0){
        time = [time stringByAppendingString:[NSString stringWithFormat:@"%ld小时", hours]];
    }
    if (minutie != 0){
        time = [time stringByAppendingString:[NSString stringWithFormat:@"%ld分钟", minutie]];
    }
    
    return time;
}

- (NSString *)time_md_hm{
    NSAssert((self.length != 10), @"time length is not 10.");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"MM-dd\nHH:mm";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.longLongValue];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)lzmYMDHMDate{
    if (self.length ==0){
        return @"";
    }
    NSUInteger currentSeconds = [self longLongValue]/1000;
    NSString *date = @(currentSeconds).stringValue;
    NSString *time = [date time_ymdhm];
    return time?time:@"";
}

- (NSString *)lzmRoomDate{
    if (self.length ==0){
        return @"";
    }
    NSUInteger currentSeconds = [self longLongValue]/1000;
    NSString *date = @(currentSeconds).stringValue;
    NSString *time = [date time_ymd];
    return time?time:@"";
}

- (NSString *)lzmDate{
    if (self.length ==0){
        return @"";
    }
    NSUInteger currentSeconds = [self longLongValue]/1000;
    NSString *date = @(currentSeconds).stringValue;
    NSString *time = [date hj_timeToYMDHMS];
    return time?time:@"";
}

- (NSString *)hj_timeToYMDHMS
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.longLongValue];
    return [dateFormatter stringFromDate:date];
}

- (NSString *)lzmRoomValidateDate{
    if (self == nil)
    return @"";
    // 2018-08-01
    NSString *month = @([[self substringWithRange:NSMakeRange(5, 2)] integerValue]).stringValue;
    NSString *day = @([[self substringWithRange:NSMakeRange(8, 2)] integerValue]).stringValue;
    return [NSString stringWithFormat:@"%@月%@日", month, day];
}

- (NSString *)lzmCouponDate{
    if (self.length ==0){
        return @"";
    }
    NSUInteger currentSeconds = [self longLongValue]/1000;
    NSString *date = @(currentSeconds).stringValue;
    NSString *time = [date couponTime];
    return time?time:@"";
}

- (NSString *)couponTime{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy/MM/dd HH:mm";
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:self.longLongValue];
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)lzmRoomDateWithDate:(NSDate *)date{
    NSString *dateString = [NSString qh_lzmRoomDay:date];
    NSString *weekStr = [NSString weekdayStringFromDate:date]; 
    NSString *finalString = [NSString stringWithFormat:@"%@（%@）", dateString, weekStr];
    return finalString;
}

+ (NSString *)lzm_uploadDate:(NSDate *)date{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    return [dateFormatter stringFromDate:date];
}

+ (NSString *)qh_lzmRoomDay:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月dd日";
    
    return [formatter stringFromDate:date];
}

+ (NSString *)weekdayStringFromDate:(NSDate *)inputDate {
    
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:inputDate];
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}

- (NSString *)nameFromRealName{
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


@end
