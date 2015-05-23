//
//  PeriscommentCell.m
//  PeriscommentView_ObjC
//
//  Created by cyan on 15/5/23.
//  Copyright (c) 2015年 cyan. All rights reserved.
//

#import "PeriscommentCell.h"
#import "PeriscommentUtils.h"
#import "PeriscommentMark.h"

@implementation PeriscommentCell

- (instancetype)initWithFrame:(CGRect)frame profileImage:(UIImage *)profileImage name:(NSString *)name comment:(NSString *)comment config:(PeriscommentConfig *)config {
    if (self = [super initWithFrame:frame]) {
        CGPoint namePos = CGPointMake(config.layout.markWidth+config.layout.offset, config.layout.padding);
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(namePos.x, namePos.y, 0, 0)];
        _nameLabel.font = config.nameFont.font;
        _nameLabel.textColor = config.nameFont.color;
        _nameLabel.text = name;
        [_nameLabel sizeToFit];
        
        CGPoint commentPos = CGPointMake(config.layout.markWidth+config.layout.offset, _nameLabel.frame.size.height+config.layout.padding+config.layout.commentSpace);
        CGFloat maxCommentWidth = config.layout.maxCommentWidth;
        
        _commentLabel = [[CommentLabel alloc] initWithFrame:CGRectMake(commentPos.x, commentPos.y, 0, 0) font:config.commentFont allowLineBreak:config.layout.allowLineBreak maxWidth:maxCommentWidth];
        _commentLabel.text = comment;
        [_commentLabel sizeToFit];
    
        [self setupView:profileImage name:name comment:comment config:config];
    }
    return self;
}

- (void)setupView:(UIImage *)profileImage name:(NSString *)name comment:(NSString *)comment config:(PeriscommentConfig *)config {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    
    [self addSubview:self.nameLabel];
    [self addSubview:self.commentLabel];
    
    CGFloat commentWidth = MAX(self.nameLabel.frame.size.width, self.commentLabel.frame.size.width);
    CGFloat inferedWidth = config.layout.markWidth + config.layout.offset + commentWidth + config.layout.padding * 2;
    CGFloat width = MIN(inferedWidth, config.layout.maximumWidth);
    CGFloat height = config.layout.padding * 2 + config.layout.commentSpace + self.nameLabel.frame.size.height + self.commentLabel.frame.size.height;
    self.frame = CGRectMake(0, 0, width, height);
    
    CGSize markSize = CGSizeMake(config.layout.markWidth, height);
    CGRect markRect = CGRectMake(0, 0, markSize.width, markSize.height);
    
    self.mark = [[PeriscommentMark alloc] initWithFrame:markRect image:profileImage];
    [self addSubview:self.mark];
}

@end
