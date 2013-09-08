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
@property(nonatomic) float slideShowInterval;

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
    self.backgroundColor = [UIColor blackColor];
    
    self.photoList = [[HALPhotoList alloc] init];
    [self.photoList loadPhotoList];
    self.currentIndex = [self.photoList.photoList count];
    
    self.slideShowImageView = [[UIImageView alloc] initWithFrame:self.frame];
    [self addSubview:self.slideShowImageView];
    
    self.slideShowInterval = kHALSlideShowTimerInterval;
    
    [self slideShowTimerLoop];
    self.slideShowTimer = [NSTimer scheduledTimerWithTimeInterval:self.slideShowInterval
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
    [self setImageAndAnimation:entity.image];
    
    self.currentIndex++;
}

- (void)setImageAndAnimation:(UIImage *)image
{
    // set image
    [self.slideShowImageView setImage:image];
    
    // set start frame
    CGFloat screenWidth = self.frame.size.width;
    CGFloat screenHeight = self.frame.size.height;
    CGFloat base_width = MAX(image.size.width / image.size.height * screenHeight, screenWidth);
    CGFloat base_height = MAX(image.size.height / image.size.width * screenWidth, screenHeight);

    // sw:0 拡大 sw:1 縮小　アニメーション
    BOOL sw = (BOOL)(rand() % 2);
    
    CGFloat scale = sw ? [self randFrom:1 to:1.5] : 1;
    CGFloat width = base_width * scale;
    CGFloat height = base_height * scale;
    CGFloat x = (screenWidth - width) / 2;
    CGFloat y = (screenHeight - height) / 2;
    [self.slideShowImageView setFrame:CGRectMake(x, y, width, height)];
    
    // animation
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:self.slideShowInterval];

    scale = sw ? 1 : [self randFrom:1 to:1.5];
    width = base_width * scale;
    height = base_height * scale;
    x = [self randFrom:screenWidth - width to:0];
    y = [self randFrom:screenHeight - height to:0];
    [self.slideShowImageView setFrame:CGRectMake(x, y, width, height)];

    [UIView commitAnimations];
}

- (CGFloat)randFrom:(CGFloat)a to:(CGFloat)b
{
    CGFloat x = ((CGFloat)arc4random()) / UINT_MAX;
    return x * (b - a) + a;
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
