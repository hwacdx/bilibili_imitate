//
//  HWHomeViewController.m
//  bilibili_imitate 首页视图控制器
//
//  Created by hw on 16/8/20.
//  Copyright © 2016年 hwacdx. All rights reserved.
//

#import "HWHomeViewController.h"
#import "HWLiveViewController.h"
#import "HWRecommendViewController.h"
#import "HWDramaViewController.h"
#import "UIColor+Tool.h"

@interface HWHomeViewController ()

@end

@implementation HWHomeViewController

#pragma mark - viewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpAllViewController];
    
    [self setUpTitleEffect:^(UIColor *__autoreleasing *titleScrollViewColor, UIColor *__autoreleasing *norColor, UIColor *__autoreleasing *selColor, UIFont *__autoreleasing *titleFont, CGFloat *titleHeight, CGFloat *titleWidth) {
        *norColor = [UIColor whiteColor];
        *selColor = [UIColor whiteColor];
        *titleFont = [UIFont systemFontOfSize:14];
        *titleWidth = [UIScreen mainScreen].bounds.size.width / 3;
        *titleScrollViewColor = [UIColor lightGrayColor];
    }];

    [self setUpUnderLineEffect:^(BOOL *isUnderLineDelayScroll, CGFloat *underLineH, UIColor *__autoreleasing *underLineColor,BOOL *isUnderLineEqualTitleWidth) {
//        *isUnderLineDelayScroll = YES; 设置UnderLine随着VC滚动
        *isUnderLineEqualTitleWidth = YES;
        *underLineColor = [UIColor hexColor:@"F9749A"];
    }];
}

// 添加所有子控制器
- (void)setUpAllViewController
{
    HWLiveViewController *liveVC = [[HWLiveViewController alloc] init];
    liveVC.title = @"直播";
    liveVC.view.backgroundColor = [UIColor lightGrayColor];
    [self addChildViewController:liveVC];
    
    HWRecommendViewController *recommendVC = [[HWRecommendViewController alloc] init];
    recommendVC.title = @"推荐";
    recommendVC.view.backgroundColor = [UIColor redColor];
    [self addChildViewController:recommendVC];
    
    HWDramaViewController *dramaVC = [[HWDramaViewController alloc] init];
    dramaVC.title = @"番剧";
    dramaVC.view.backgroundColor = [UIColor purpleColor];
    [self addChildViewController:dramaVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
