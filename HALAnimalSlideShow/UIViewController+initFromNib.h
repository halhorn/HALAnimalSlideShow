//
//  UIViewController+initFromNib.h
//  HALAnimalPhotoShare
//
//  Created by 信田 春満 on 2013/08/15.
//  Copyright (c) 2013年 halhorn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (initFromNib)
- (id)initFromNib;
+ (instancetype)viewControllerFromNib;
@end
