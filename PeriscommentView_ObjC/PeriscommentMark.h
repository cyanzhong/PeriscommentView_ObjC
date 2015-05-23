//
//  PeriscommentMark.h
//  PeriscommentView_ObjC
//
//  Created by cyan on 15/5/23.
//  Copyright (c) 2015年 cyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PeriscommentMark : UIView

@property (nonatomic, strong) UIColor *color;
@property (nonatomic, strong) UIImageView *imageView;

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image;

@end
