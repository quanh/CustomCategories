//
//  NSArray+noneCrash.h
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/3/25.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (noneCrash)



/**
 超出index 范围的 会返回离index最近的值

 @param index index description
 @return return value description
 */
- (id)safeObjectAtIndex:(NSInteger)index;

/**
 超出index 范围的会返回nil

 @param index index
 @return return value description
 */
- (id)noneExceptionObjectAtIndex:(NSInteger)index;






@end

NS_ASSUME_NONNULL_END
