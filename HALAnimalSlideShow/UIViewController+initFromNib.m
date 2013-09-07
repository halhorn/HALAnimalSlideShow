//
//  UIViewController+initFromNib.m
//  HALAnimalPhotoShare
//
//  Created by 信田 春満 on 2013/08/15.
//  Copyright (c) 2013年 halhorn. All rights reserved.
//

#import "UIViewController+initFromNib.h"

@implementation UIViewController (initFromNib)
- (id)initFromNib
{
    self = [self initWithNibName:NSStringFromClass([self class]) bundle:nil];
    if (self) {
        
    }
    return self;
}

+ (instancetype)viewControllerFromNib
{
    return [[self alloc] initFromNib];
}
@end
