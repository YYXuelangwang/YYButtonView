//
//  YYButtonView.h
//  CustomButton
//
//  Created by yinyong on 16/3/12.
//  Copyright © 2016年 yinyong. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YYButtonView;

@protocol YYButtonViewDelegate <NSObject>

- (void)clickButtonView:(YYButtonView*)buttonView;

@end

@interface YYButtonView : UIView
{
    /**label的高度*/
    CGFloat _labelHeight;
    
    
    /**是否是圆图，默认为圆图*/
    BOOL _isImageCircle;
    
}

/**view中的imageView,readonly*/
@property (nonatomic, strong, readonly) UIImageView *imageView;

/**view中的label,readonly*/
@property (nonatomic, strong, readonly) UILabel *label;

@property (nonatomic, weak) id<YYButtonViewDelegate> delegate;

//设置图片和文字的方法
- (void)setImageName:(NSString*)imageName withTitle:(NSString*)title;
@end
