//
//  PeriscommentUtils.h
//  PeriscommentView_ObjC
//
//  Created by cyan on 15/5/23.
//  Copyright (c) 2015年 cyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ColorGenerator : NSObject

+ (UIColor *)pick;

@end

@interface PeriscommentLayout : NSObject

@property (nonatomic, readonly, assign) CGFloat offset;
@property (nonatomic, readonly, assign) CGFloat padding;
@property (nonatomic, readonly, assign) CGFloat commentSpace;
@property (nonatomic, readonly, assign) CGFloat cellSpace;
@property (nonatomic, readonly, assign) CGFloat maximumWidth;
@property (nonatomic, readonly, assign) CGFloat markWidth;
@property (nonatomic, readonly, assign) CGFloat allowLineBreak;
@property (nonatomic, readonly, strong) UIColor *backgroundColor;

- (CGFloat)maxCommentWidth;

@end

@interface PeriscommentFont : NSObject

@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *color;

@end

@interface PeriscommentConfig : NSObject

@property (nonatomic, strong) PeriscommentLayout *layout;
@property (nonatomic, strong) PeriscommentFont *commentFont;
@property (nonatomic, strong) PeriscommentFont *nameFont;
@property (nonatomic, assign) CGFloat disappearDuration;
@property (nonatomic, assign) CGFloat appearDuration;

@end

@interface CommentLabel : UILabel

@property (nonatomic, assign) BOOL allowLineBreak;
@property (nonatomic, assign) CGFloat maxCommentWidth;

- (instancetype)initWithFrame:(CGRect)frame font:(PeriscommentFont *)font allowLineBreak:(BOOL)allowLineBreak maxWidth:(CGFloat)maxWidth;

@end

@interface PeriscommentUtils : NSObject

@end
