//
//  ICMCMouseViewController.m
//  iController
//
//  Created by 吴双 on 16/2/8.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMCMouseViewController.h"

@interface ICMCMouseViewController ()

@property (nonatomic, strong) UILabel *descriptionLabel;

@end

@implementation ICMCMouseViewController

- (instancetype)init {
	self = [super init];
	if (self) {
		self.title = @"鼠标呼吸灯";
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view addSubview:self.descriptionLabel];
	self.bigButton.titleForDeselectNormal = @"关闭鼠标呼吸灯";
	self.smallButton.titleForDeselectNormal = @"打开";
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	self.descriptionLabel.midX = self.view.midPoint.x;
	self.descriptionLabel.toSuperViewBottom = 5;
}

- (UILabel *)descriptionLabel {
	if (!_descriptionLabel) {
		_descriptionLabel = [UILabel new];
		_descriptionLabel.numberOfLines = 0;
		_descriptionLabel.font = [UIFont systemFontOfSize:10];
		_descriptionLabel.textColor = Const_Color_Subtitle;
		_descriptionLabel.text = @"该功能目前仅支持牧马人鼠标, 使用前具体设置请看帮助.";
		[_descriptionLabel sizeToFit];
	}
	return _descriptionLabel;
}

@end
