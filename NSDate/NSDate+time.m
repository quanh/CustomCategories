//
//  NSDate+time.m
//  lzm-repos
//
//  Created by Quanhai on 2019/1/7.
//  Copyright © 2019 Quanhai. All rights reserved.
//

#import "NSDate+time.h"

@implementation NSDate (time)

- (NSString *)time_ymdhms{
    NSAssert(self, @"nil date try to format");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    return [dateFormatter stringFromDate:self];
}

- (NSString *)time_ymdhm{
    NSAssert(self, @"nil date try to format");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm";
    return [dateFormatter stringFromDate:self];
}

- (NSString *)time_ymd{
    NSAssert(self, @"nil date try to format");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    return [dateFormatter stringFromDate:self];
}

- (NSString *)timeToYMD{
    NSAssert(self, @"nil date try to format");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy年MM月dd日";
    return [dateFormatter stringFromDate:self];
}

- (NSString *)timeToMD{
    NSAssert(self, @"nil date try to format");
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"MM月dd日";
    return [formatter stringFromDate:self];
}

- (NSString *)timeHour{
    NSAssert(self, @"nil date try to format");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"HH";
    return [dateFormatter stringFromDate:self];
}

- (NSString *)time_YMD{
    NSAssert(self, @"nil date try to format");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyyMMdd";
    return [dateFormatter stringFromDate:self];
}

- (NSDate *)nextWeekend:(NSInteger)days{
    if (days == 0){
        return self;
    }
    
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierRepublicOfChina];
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitWeekdayOrdinal;
    NSTimeInterval milliSeconds = self.timeIntervalSince1970;
    NSDate *nextDate ;
    for (int i= 1; i <= days; i ++) {
        milliSeconds += 24*60*60; // 秒
        nextDate = [NSDate dateWithTimeIntervalSince1970:milliSeconds];
        comps = [calendar components:unitFlags fromDate:nextDate];
        NSInteger weekday = [comps weekday]; // 当前星期
        if (weekday == 1 || weekday == 7){
            // 周7 6
            i--;
        }
    }
    
    return nextDate;
}

- (NSDate *)nextWeekdaysWithDay:(NSInteger)day{
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierRepublicOfChina];
    NSDateComponents *comps = nil;
    NSInteger unitFlags = NSCalendarUnitWeekday | NSCalendarUnitDay | NSCalendarUnitWeekdayOrdinal;
    NSTimeInterval milliSeconds ;
    NSDate *nextDate ;
    milliSeconds = 24*60*60 *day; // 秒
    nextDate = [NSDate dateWithTimeInterval:milliSeconds sinceDate:self];
    comps = [calendar components:unitFlags fromDate:nextDate];
    NSInteger weekday = [comps weekday]; // 星期
    if (weekday > 1 && weekday < 7){
        // 工作日
        return nextDate;
    }else{
        return nil;
    }
}


#pragma mark - custom
- (NSString *)weekday{
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:self];
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}

- (NSString *)meetingRoomTime{
    NSString *dateString = [self timeToMD];
    NSString *weekStr = [self weekday];
    NSString *finalString = [NSString stringWithFormat:@"%@（%@）", dateString, weekStr];
    return finalString;
}

- (NSString *)hzAutoDate{
    NSInteger timeSeconds = -[self timeIntervalSinceNow];
    NSInteger days = timeSeconds /(24*60*60);
    if (days == 0){
        // 当天内
        NSInteger hours = timeSeconds /(60*60);
        if (hours == 0){
            // 一个小时内
            NSInteger minutes = timeSeconds /(60);
            if (minutes == 0){
                return @"刚刚";
            }else{
                return [NSString stringWithFormat:@"%ld分钟前", (long)minutes];
            }
        }else{
            // 大于一个小时 小于24 小时
            return [NSString stringWithFormat:@"%ld小时前", hours];
        }
    }else if(days <7){
        // 几天前
        return [NSString stringWithFormat:@"%ld天前", days];
    }else{
        // 大于7天
        NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierRepublicOfChina];
        NSInteger unitFlags = NSCalendarUnitYear;
        NSDateComponents *compsNow = [calendar components:unitFlags fromDate:[NSDate date]];
        NSDateComponents *compsSelf = [calendar components:unitFlags fromDate:self];
        NSInteger yearNow = [compsNow year];
        NSInteger yearSelf = [compsSelf year];
        if (yearNow == yearSelf){
            // 同一年
            NSString *dateString = [self timeToMD];
            return dateString;
        }else{
            // 早年
            NSString *dateString = [self timeToYMD];
            return dateString;
        }
    }
}

#pragma mark - 计算date N月后的日期
- (NSDate *)dateAfterGgapMonth:(NSInteger)gapMonthCount {
    //获取当年的月份，当月的总天数
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitCalendar fromDate:self];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    
    NSString *dateStr = @"";
    NSInteger endDay = 0;//天
    NSDate *newDate = [NSDate date];//新的年&月
    //判断是否是下一年
    if (components.month+gapMonthCount > 12) {
        //是下一年
        dateStr = [NSString stringWithFormat:@"%zd-%zd-01",components.year+(components.month+gapMonthCount)/12,(components.month+gapMonthCount)%12];
        newDate = [formatter dateFromString:dateStr];
        //新月份的天数
        NSInteger newDays = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:newDate].length;
        if ([self isEndOfTheMonth]) {//当前日期处于月末
            endDay = newDays;
        } else {
            endDay = newDays < components.day?newDays:components.day;
        }
        dateStr = [NSString stringWithFormat:@"%zd-%zd-%zd",components.year+(components.month+gapMonthCount)/12,(components.month+gapMonthCount)%12,endDay];
    } else {
        //依然是当前年份
        dateStr = [NSString stringWithFormat:@"%zd-%zd-01",components.year,components.month+gapMonthCount];
        newDate = [formatter dateFromString:dateStr];
        //新月份的天数
        NSInteger newDays = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:newDate].length;
        if ([self isEndOfTheMonth]) {//当前日期处于月末
            endDay = newDays;
        } else {
            endDay = newDays < components.day?newDays:components.day;
        }
        
        dateStr = [NSString stringWithFormat:@"%zd-%zd-%zd",components.year,components.month+gapMonthCount,endDay];
    }
    
    newDate = [formatter dateFromString:dateStr];
    return newDate;
}

//判断是否是月末
- (BOOL)isEndOfTheMonth {
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSInteger daysInMonth = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self].length;
    NSDateComponents *componets = [calendar components:NSCalendarUnitDay fromDate:self];
    if (componets.day >= daysInMonth) {
        return YES;
    }
    return NO;
}

@end
