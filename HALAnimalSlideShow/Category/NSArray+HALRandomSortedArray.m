//
//  NSArray+HALRandomSortedArray.m
//  HALAnimalSlideShow
//
//  Created by 信田 春満 on 2013/09/08.
//  Copyright (c) 2013年 halhorn. All rights reserved.
//

#import "NSArray+HALRandomSortedArray.h"

@implementation NSArray (HALRandomSortedArray)

- (NSArray *) randomSortedArray
{
    NSMutableArray *results = [NSMutableArray arrayWithArray:self];
    int i = [results count];
    
    while(--i) {
        int j = rand() % (i+1);
        [results exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    return [NSArray arrayWithArray:results];
}

@end
