//
//  PeriscommentCell.h
//  PeriscommentView_ObjC
//
//  Created by cyan on 15/5/23.
//  Copyright (c) 2015年 cyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PeriscommentMark;
@class PeriscommentConfig;
@class CommentLabel;

@interface PeriscommentCell : UIView

@property (nonatomic, strong) PeriscommentMark *mark;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) CommentLabel *commentLabel;

- (instancetype)initWithFrame:(CGRect)frame profileImage:(UIImage *)profileImage name:(NSString *)name comment:(NSString *)comment config:(PeriscommentConfig *)config;

@end
