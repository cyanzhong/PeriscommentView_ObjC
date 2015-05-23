//
//  PeriscommentUtils.m
//  PeriscommentView_ObjC
//
//  Created by cyan on 15/5/23.
//  Copyright (c) 2015年 cyan. All rights reserved.
//

#import "PeriscommentUtils.h"

@implementation ColorGenerator

+ (UIColor *)pick {
    UIColor *red = [UIColor colorWithRed:0.96 green:0.26 blue:0.21 alpha:0.7];
    UIColor *pink = [UIColor colorWithRed:0.91 green:0.12 blue:0.38 alpha:0.7];
    UIColor *purple = [UIColor colorWithRed:0.61 green:0.15 blue:0.69 alpha:0.7];
    UIColor *blue = [UIColor colorWithRed:0.12 green:0.59 blue:0.95 alpha:0.7];
    UIColor *green = [UIColor colorWithRed:0.3 green:0.69 blue:0.31 alpha:0.7];
    UIColor *yellow = [UIColor colorWithRed:1.0 green:0.92 blue:0.23 alpha:0.7];
    UIColor *orange = [UIColor colorWithRed:1.0 green:0.6 blue:0 alpha:0.7];
    NSArray *colors = @[red, pink, purple, blue, green, yellow, orange];
    int index = arc4random_uniform((u_int32_t)colors.count);
    return colors[index];
}

@end

@implementation PeriscommentLayout

- (instancetype)init {
    if (self = [super init]) {
        _offset = 10.0;
        _padding = 2.5;
        _commentSpace = 1.5;
        _cellSpace = 4.0;
        _maximumWidth = 200.0;
        _markWidth = 40.0;
        _allowLineBreak = YES;
        _backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (CGFloat)maxCommentWidth {
    return self.maximumWidth - (self.padding * 2 + self.markWidth + self.offset);
}

@end

@implementation PeriscommentFont

@end

@implementation PeriscommentConfig

- (instancetype)init {
    if (self = [super init]) {
        _layout = [[PeriscommentLayout alloc] init];
        _commentFont = [[PeriscommentFont alloc] init];
        _commentFont.font = [UIFont systemFontOfSize:15];
        _commentFont.color = [UIColor blackColor];
        _nameFont = [[PeriscommentFont alloc] init];
        _nameFont.font = [UIFont systemFontOfSize:12];
        _nameFont.color = [UIColor lightGrayColor];
        _disappearDuration = 6.0;
        _appearDuration = 1.0;
    }
    return self;
}

@end

@implementation CommentLabel

- (instancetype)initWithFrame:(CGRect)frame font:(PeriscommentFont *)font allowLineBreak:(BOOL)allowLineBreak maxWidth:(CGFloat)maxWidth {
    if (self = [super initWithFrame:frame]) {
        _allowLineBreak = allowLineBreak;
        _maxCommentWidth = maxWidth;
        self.textColor = font.color;
        self.font = font.font;
    }
    return self;
}

- (void)sizeToFit {
    if (self.allowLineBreak) {
        self.lineBreakMode = NSLineBreakByWordWrapping;
        self.numberOfLines = 0;
    }
    
    [super sizeToFit];
    
    CGRect frame = self.frame;
    frame.size.width = MIN(self.maxCommentWidth, self.frame.size.width);
    self.frame = frame;
    
    [super sizeToFit];
}

@end

@implementation PeriscommentUtils

@end
