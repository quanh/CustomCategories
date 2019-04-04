//
//  NSMutableArray+noneCrash.m
//  LZM_SmartEdifice
//
//  Created by Quanhai on 2019/3/25.
//  Copyright © 2019 SZ_LZM. All rights reserved.
//

#import "NSMutableArray+noneCrash.h"

@implementation NSMutableArray (noneCrash)

- (void)addSafeObject:(id)anObject{
    if (anObject){
        [self addObject:anObject];
    }
}

- (void)addCertainObject:(id)anObject{
    if (anObject){
        [self addObject:anObject];
    }else{
        [self addObject:@""];
    }
}

- (void)replaceSafeObjectAtIndex:(NSUInteger)index withObject:(id)anObject{
    if (anObject && index < self.count){
        [self replaceObjectAtIndex:index withObject:anObject];
    }
}



@end
