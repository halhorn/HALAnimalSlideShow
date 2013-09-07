//
//  HALPhotoList.h
//  HALAnimalSlideShow
//
//  Created by 信田 春満 on 2013/09/07.
//  Copyright (c) 2013年 halhorn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HALPhotoList : NSObject

@property(nonatomic, readonly) NSArray *photoList;

-(NSArray *)loadPhotoList;

@end
