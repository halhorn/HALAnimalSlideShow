//
//  HALPhotoEntity.m
//  HALAnimalSlideShow
//
//  Created by 信田 春満 on 2013/09/07.
//  Copyright (c) 2013年 halhorn. All rights reserved.
//

#import "HALPhotoEntity.h"

@implementation HALPhotoEntity

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title
{
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
    }
    return self;
}

+ (instancetype)photoEntityWithImage:(UIImage *)image title:(NSString *)title
{
    return [[self alloc] initWithImage:image title:title];
}

@end
