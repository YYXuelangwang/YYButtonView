//
//  YYButtonView.m
//  CustomButton
//
//  Created by yinyong on 16/3/12.
//  Copyright © 2016年 yinyong. All rights reserved.
//

#import "YYButtonView.h"

@implementation YYButtonView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _labelHeight = 30;
        _isImageCircle = YES;
    }
    return self;
}

- (void)setImageName:(NSString *)imageName withTitle:(NSString *)title{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(width / 4, (height / 2 - _labelHeight) / 2, width / 2, height / 2)];
    _imageView = imageView;
    imageView.image = [UIImage imageNamed:imageName];
    if (_isImageCircle) {
        imageView.layer.cornerRadius = width / 4;
        imageView.layer.masksToBounds = YES;
    }
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, (height / 2 - _labelHeight) / 2 + height / 2, width, _labelHeight)];
    _label = label;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = title;
    [self addSubview:label];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tap];
}

-(void)tap{
    if ([self.delegate respondsToSelector:@selector(clickButtonView:)]) {
        [self.delegate clickButtonView:self];
    }
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
