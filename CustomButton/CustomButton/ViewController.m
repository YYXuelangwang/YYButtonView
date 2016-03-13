//
//  ViewController.m
//  CustomButton
//
//  Created by yinyong on 16/3/12.
//  Copyright © 2016年 yinyong. All rights reserved.
//

#import "ViewController.h"
#import "YYButtonView.h"

@interface ViewController ()<YYButtonViewDelegate>
{
    NSArray *_imageNameArray;
    NSArray *_titleArray;
}
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    _imageNameArray = @[@"1",@"2",@"3"];
    _titleArray = @[@"图片",@"取消",@"添加"];
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 4) / 3;
    for (int i = 0; i < 3; i ++) {
        YYButtonView *btnView = [[YYButtonView alloc] initWithFrame:CGRectMake((width + 2) * i, 100, width, width)];
        [btnView setImageName:_imageNameArray[i] withTitle:_titleArray[i]];
        btnView.backgroundColor = [UIColor colorWithRed:255/255.0 green:129/255.0 blue:78/255.0 alpha:1.0];
        btnView.tag = i;
        btnView.delegate = self;
        [self.view addSubview:btnView];
    }
    
    CGFloat otherWidth = [UIScreen mainScreen].bounds.size.width / 2;
    YYButtonView *otherBtnView = [[YYButtonView alloc] initWithFrame:CGRectMake(0, 100 + width + 2, otherWidth, otherWidth + 100)];
    [otherBtnView setImageName:@"4" withTitle:@"邮件"];
    otherBtnView.backgroundColor = [UIColor lightGrayColor];
    otherBtnView.tag = 3;
    otherBtnView.delegate = self;
    [self.view addSubview:otherBtnView];
}

- (void)clickButtonView:(YYButtonView *)buttonView{
    UIViewController *viewController = [UIViewController new];
    if (buttonView.tag == 0) {
        viewController.view.backgroundColor = [UIColor redColor];
    }
    if (buttonView.tag == 1) {
        viewController.view.backgroundColor = [UIColor blackColor];
    }
    if (buttonView.tag == 2) {
        viewController.view.backgroundColor = [UIColor yellowColor];
    }
    if (buttonView.tag == 3) {
        viewController.view.backgroundColor = [UIColor lightGrayColor];
    }
    [self.navigationController pushViewController:viewController animated:YES];
    NSLog(@"点击了图标");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
