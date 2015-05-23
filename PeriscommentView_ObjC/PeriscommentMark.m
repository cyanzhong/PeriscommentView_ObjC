//
//  PeriscommentMark.m
//  PeriscommentView_ObjC
//
//  Created by cyan on 15/5/23.
//  Copyright (c) 2015年 cyan. All rights reserved.
//

#import "PeriscommentMark.h"
#import "PeriscommentUtils.h"

@implementation PeriscommentMark

- (instancetype)initWithFrame:(CGRect)frame image:(UIImage *)image {
    if (self = [super initWithFrame:frame]) {
        
        self.color = [ColorGenerator pick];
        
        [self setupView:image];
    }
    return self;
}

- (void)setupView:(UIImage *)image {
    _imageView = [[UIImageView alloc] initWithImage:image];
    _imageView.frame = self.frame;
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_imageView];
    
    UIView *colorView = [[UIView alloc] initWithFrame:self.frame];
    colorView.backgroundColor = self.color;
    [self addSubview:colorView];
}

@end
