//
//  ICNavigationController.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICNavigationController.h"

@interface ICNavigationController ()

@end

@implementation ICNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"titlebar_bg"] forBarMetrics:UIBarMetricsDefault];
	[self.navigationBar setShadowImage:[UIImage imageNamed:@"titlebar_bg_shadow"]];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
	if (self.viewControllers.count >= 1) {
		UIButton *button = [UIButton new];
		button.backgroundImageForDeselectNormal = [UIImage imageNamed:@"btn_back.9"];
		button.backgroundImageForDeselectHighlighted = [UIImage imageNamed:@"btn_back_down.9"];
		button.titleForDeselectNormal = @"   返回";
		button.titleColorForDeselectNormal = Const_Color_Title;
		button.titleColorForDeselectHighlighted = Const_Color_Background;
		button.titleLabel.font = [UIFont systemFontOfSize:15];
		[button addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		[button sizeToFit];
		button.width = 70;
		viewController.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc] initWithCustomView:button];
//		viewController.navigationItem.leftBarButtonItem = ;
	}
	viewController.view.backgroundColor = Const_Color_Background;
	[super pushViewController:viewController animated:animated];
	self.interactivePopGestureRecognizer.enabled = YES;
}

- (void)backButtonClick:(UIButton *)sender {
	[self popViewControllerAnimated:YES];
}

@end
