//
//  HALPhotoEntity.h
//  HALAnimalSlideShow
//
//  Created by 信田 春満 on 2013/09/07.
//  Copyright (c) 2013年 halhorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HALPhotoEntity : NSObject

@property(nonatomic) UIImage *image;
@property(nonatomic) NSString *title;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title;
+ (instancetype)photoEntityWithImage:(UIImage *)image title:(NSString *)title;

@end
