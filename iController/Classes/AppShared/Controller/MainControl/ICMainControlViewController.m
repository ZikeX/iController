//
//  ICMainControlViewController.m
//  iController
//
//  Created by 吴双 on 16/2/7.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMainControlViewController.h"

@interface ICMainControlViewController ()
{
	ICControlButton *_bigButton;
	ICControlButton *_smallButton;
}

@end

@implementation ICMainControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = Const_Color_Background;
	[self.view addSubview:self.bigButton];
	[self.view addSubview:self.smallButton];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	self.bigButton.side = 200;
	self.smallButton.side = 100;
	
	CGFloat margin = self.view.height - self.bigButton.height - self.smallButton.height;
	margin = margin / 3;
	
	self.bigButton.midX = self.view.midPoint.x;
	self.smallButton.midX = self.view.midPoint.x;
	
	self.bigButton.toSuperViewTop = margin;
	self.smallButton.toSuperViewBottom = margin;
}

- (void)bigButtonDidClick {
	
}

- (void)smallButtonDidClick {
	
}

- (ICControlButton *)bigButton {
	if (!_bigButton) {
		_bigButton = [ICControlButton new];
		[_bigButton addTarget:self action:@selector(bigButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
		_bigButton.titleLabel.numberOfLines = 0;
		_bigButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	}
	return _bigButton;
}

- (ICControlButton *)smallButton {
	if (!_smallButton) {
		_smallButton = [ICControlButton new];
		[_smallButton addTarget:self action:@selector(smallButtonDidClick) forControlEvents:UIControlEventTouchUpInside];
		_smallButton.titleLabel.numberOfLines = 0;
		_smallButton.titleLabel.textAlignment = NSTextAlignmentCenter;
	}
	return _smallButton;
}

@end
