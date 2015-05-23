//
//  PeriscommentView.h
//  PeriscommentView_ObjC
//
//  Created by cyan on 15/5/23.
//  Copyright (c) 2015年 cyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PeriscommentConfig;
@class PeriscommentCell;

@interface PeriscommentView : UIView

- (instancetype)initWithFrame:(CGRect)frame config:(PeriscommentConfig *)config;

- (void)addCell:(PeriscommentCell *)cell;
- (void)addCell:(UIImage *)profileImage name:(NSString *)name comment:(NSString *)comment;

@end
