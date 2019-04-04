//
//  NSMutableArray+noneCrash.h
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/3/25.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSArray+noneCrash.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (noneCrash)



/**
 对object  nil进行过滤且不会插入

 @param anObject anObject description
 */
- (void)addSafeObject:(id)anObject;


/**
 对object  nil进行过滤且会插入一个空字符串

 @param anObject anObject description
 */
- (void)addCertainObject:(id)anObject;

/**
 index 和 object 进行越界和nil过滤

 @param index index description
 @param anObject anObject description
 */
- (void)replaceSafeObjectAtIndex:(NSUInteger)index withObject:(id)anObject;



@end

NS_ASSUME_NONNULL_END
