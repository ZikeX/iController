//
//  ICAboutViewController.m
//  iController
//
//  Created by 吴双 on 16/2/9.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICAboutViewController.h"

@interface ICAboutViewController ()

@property (nonatomic, strong) UIImageView *thumbImageView;

@property (nonatomic, strong) UIImageView *shadowImageView;

@property (nonatomic, strong) UIButton *backButton;

@end

@implementation ICAboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = Const_Color_Background;
	[self.view addSubview:self.thumbImageView];
	[self.view addSubview:self.shadowImageView];
	[self.view addSubview:self.backButton];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	self.thumbImageView.width = self.view.width;
	self.thumbImageView.height = 250;
	self.shadowImageView.width = self.view.width;
	self.shadowImageView.height = self.shadowImageView.image.size.height;
	self.shadowImageView.minY = self.thumbImageView.maxY;
	
	[self.backButton setTopInView:self.thumbImageView withMargin:20];
	[self.backButton setLeftInView:self.thumbImageView withMargin:10];
}

#pragma mark - Selector

- (void)backButtonClick:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}

- (UIImageView *)thumbImageView {
	if (!_thumbImageView) {
		_thumbImageView = [UIImageView new];
		_thumbImageView.image = [UIImage imageNamed:@"titlebar_bg"];
	}
	return _thumbImageView;
}

- (UIImageView *)shadowImageView {
	if (!_shadowImageView) {
		_shadowImageView = [UIImageView new];
		_shadowImageView.image = [UIImage imageNamed:@"titlebar_bg_shadow"];
	}
	return _shadowImageView;
}

- (UIButton *)backButton {
	if (!_backButton) {
		_backButton = [UIButton new];
		[_backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
		_backButton.backgroundImageForDeselectNormal = [UIImage imageNamed:@"btn_cancel.9"];
		_backButton.backgroundImageForDeselectHighlighted = [UIImage imageNamed:@"btn_cancel_down.9"];
		_backButton.titleLabel.font = [UIFont systemFontOfSize:13];
		_backButton.titleForDeselectNormal = @"返回";
		_backButton.titleColorForDeselectNormal = Const_Color_Title;
		_backButton.titleColorForDeselectHighlighted = [UIColor whiteColor];
		_backButton.size = CGSizeMake(60, 40);
	}
	return _backButton;
}

@end
