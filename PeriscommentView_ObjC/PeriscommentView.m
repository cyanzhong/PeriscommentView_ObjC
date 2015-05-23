//
//  PeriscommentView.m
//  PeriscommentView_ObjC
//
//  Created by cyan on 15/5/23.
//  Copyright (c) 2015年 cyan. All rights reserved.
//

#import "PeriscommentView.h"
#import "PeriscommentUtils.h"
#import "PeriscommentCell.h"

@interface PeriscommentView()

@property (nonatomic, strong) NSMutableArray *visibleCells;
@property (nonatomic, strong) PeriscommentConfig *config;

@end

@implementation PeriscommentView

- (instancetype)initWithFrame:(CGRect)frame config:(PeriscommentConfig *)config {
    if (self = [super initWithFrame:frame]) {
        _config = config;
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
}

- (void)setupView {
    self.backgroundColor = self.config.layout.backgroundColor;
}

- (void)addCell:(PeriscommentCell *)cell {
    
    cell.frame = CGRectMake(0, self.frame.size.height, cell.frame.size.width, cell.frame.size.height);
    [self.visibleCells addObject:cell];
    [self addSubview:cell];
    
    [UIView animateWithDuration:self.config.appearDuration delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        CGFloat dy = cell.frame.size.height + self.config.layout.cellSpace;
        
        for (PeriscommentCell *c in self.visibleCells) {
            CGAffineTransform origin = c.transform;
            CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -dy);
            c.transform = CGAffineTransformConcat(origin, transform);
        }
    } completion:nil];
    
    [UIView animateWithDuration:self.config.disappearDuration delay:self.config.appearDuration options:UIViewAnimationOptionCurveEaseIn animations:^{
        cell.alpha = 0.0;
    } completion:^(BOOL finished) {
        [cell removeFromSuperview];
        [self.visibleCells removeLastObject];
    }];
}

- (void)addCell:(UIImage *)profileImage name:(NSString *)name comment:(NSString *)comment {
    CGRect rect = CGRectZero;
    PeriscommentCell *cell = [[PeriscommentCell alloc] initWithFrame:rect profileImage:profileImage name:name comment:comment config:self.config];
    [self addCell:cell];
}

@end
