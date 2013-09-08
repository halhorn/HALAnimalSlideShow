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

#define kHALSlideShowTimerInterval 5

@interface HALSlideShowViewComponent()

@property(nonatomic) HALPhotoList *photoList;
@property(nonatomic) NSTimer *slideShowTimer;
@property(nonatomic) int currentIndex;

//@property (weak, nonatomic) IBOutlet UIImageView *slideShowImageView;
@property (nonatomic) UIImageView *slideShowImageView;

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
    self.currentIndex = [self.photoList.photoList count];
    
    self.slideShowImageView = [[UIImageView alloc] initWithFrame:self.frame];
    [self addSubview:self.slideShowImageView];
    
    [self slideShowTimerLoop];
    self.slideShowTimer = [NSTimer scheduledTimerWithTimeInterval:kHALSlideShowTimerInterval
                                                           target:self
                                                         selector:@selector(slideShowTimerLoop)
                                                         userInfo:nil
                                                          repeats:YES];
}

- (void)slideShowTimerLoop
{
    if (self.currentIndex == [self.photoList.photoList count]) {
        [self.photoList sortRandom];
        self.currentIndex = 0;
    }
    HALPhotoEntity *entity = self.photoList.photoList[self.currentIndex];
    [self.slideShowImageView setImage:entity.image];
    
    self.currentIndex++;
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
