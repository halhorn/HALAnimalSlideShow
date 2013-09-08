//
//  HALPhotoList.m
//  HALAnimalSlideShow
//
//  Created by 信田 春満 on 2013/09/07.
//  Copyright (c) 2013年 halhorn. All rights reserved.
//

#import "HALPhotoList.h"
#import "HALPhotoEntity.h"
#import "NSArray+HALRandomSortedArray.h"

@implementation HALPhotoList

- (void)loadPhotoList
{
    // ねこ
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 1; i <= 2; i++) {
        NSString *fileName = [NSString stringWithFormat:@"cat%04d.jpg", i];
        HALPhotoEntity *entity = [HALPhotoEntity photoEntityWithImage:[UIImage imageNamed:fileName]
                                                                title:@"ねこ"];
        [array addObject:entity];
    }
    _photoList = [NSArray arrayWithArray:array];
}

- (void)sortRandom
{
    _photoList = [self.photoList randomSortedArray];
}
@end
