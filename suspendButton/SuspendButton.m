//
//  SuspendButton.m
//  webViewForHttps
//
//  Created by wujie on 16/6/12.
//  Copyright © 2016年 yinyong. All rights reserved.
//

#import "SuspendButton.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@implementation SuspendButton

- (instancetype)init{
    return [self initWithFrame:CGRectMake(0, 0, 60, 60)];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = frame.size.width * 0.5;
        self.alpha = 0.3;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveInTheScreen:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}

- (void)moveInTheScreen:(UIPanGestureRecognizer*)pan{
    
    NSAssert(self.superview, @"btn.superView cann't be nil");
    
    CGPoint pt = [pan locationInView:self.superview];
    self.center = pt;
    switch (pan.state) {
        case UIGestureRecognizerStateEnded:
            
            [self handleTheBtnToSideWith:pt];
            NSLog(@"pan end");
            break;
            
        case UIGestureRecognizerStateBegan:
            
            self.alpha = 1.0;
            break;
            
        default:
            break;
    }
}

- (void)handleTheBtnToSideWith:(CGPoint)lastPt{
    
    CGPoint center = CGPointZero;
    
    if (CGRectContainsPoint(CGRectMake(0, 64, kScreenWidth * 0.5, kScreenHeight - 64 - 49), lastPt)) {
        center = CGPointMake(self.frame.size.width * 0.5, lastPt.y);
    }
    
    if (CGRectContainsPoint(CGRectMake(kScreenWidth * 0.5, 64, kScreenWidth * 0.5, kScreenHeight - 64 - 49), lastPt)) {
        center = CGPointMake(kScreenWidth - self.frame.size.width * 0.5, lastPt.y);
    }
    
    if (CGRectContainsPoint(CGRectMake(0, 0, kScreenWidth, 64), lastPt)) {
        center = CGPointMake(lastPt.x, self.frame.size.height * 0.5);
    }
    
    if (CGRectContainsPoint(CGRectMake(0, kScreenHeight - 49, kScreenWidth, 49), lastPt)) {
        center = CGPointMake(lastPt.x, kScreenHeight - self.frame.size.height * 0.5);
    }
    
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.center = center;
        self.alpha = 0.3;
    } completion:^(BOOL finished) {
    }];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
