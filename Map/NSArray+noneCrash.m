//
//  NSArray+noneCrash.m
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/3/25.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import "NSArray+noneCrash.h"
#import <objc/runtime.h>

@implementation NSArray (noneCrash)

- (id)safeObjectAtIndex:(NSInteger)index{
    if (index < self.count && index >=0){
        return [self objectAtIndex:index];
    }
    if (index >= self.count){
        return self.lastObject;
    }
    return self.firstObject;
}

- (id)noneExceptionObjectAtIndex:(NSInteger)index{
    if (index < self.count && index >=0){
        return [self objectAtIndex:index];
    }
    return nil;
}



@end
