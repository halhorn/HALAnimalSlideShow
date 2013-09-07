//
//  HALSlideShowViewComponent.m
//  HALAnimalSlideShow
//
//  Created by 信田 春満 on 2013/09/08.
//  Copyright (c) 2013年 halhorn. All rights reserved.
//

#import "HALSlideShowViewComponent.h"
#import "HALPhotoList.h"
#import "HALPhotoEntity.h"

@interface HALSlideShowViewComponent()

@property(nonatomic) HALPhotoList *photoList;

@end

@implementation HALSlideShowViewComponent

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.photoList = [[HALPhotoList alloc] init];
    [self.photoList loadPhotoList];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
