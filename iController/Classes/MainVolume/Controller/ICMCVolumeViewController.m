//
//  ICMCVolumeViewController.m
//  iController
//
//  Created by 吴双 on 16/2/9.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMCVolumeViewController.h"
#import "ICMCVolumeView.h"

@interface ICMCVolumeViewController () <ICMCVolumeViewDelegate>

@property (nonatomic, strong) ICMCVolumeView *volumeView;

@end

@implementation ICMCVolumeViewController

- (instancetype)init {
	self = [super init];
	if (self) {
		self.title = @"音量";
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view addSubview:self.volumeView];
	
	self.bigButton.titleLabel.font = [UIFont boldSystemFontOfSize:25];
	[self volumeViewDidChangeVolume:self.volumeView];
	self.smallButton.titleForDeselectNormal = @"静音";
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	self.volumeView.width = self.view.width - 40;
	self.volumeView.height = 60;
	self.volumeView.midX = self.view.midPoint.x;
	
	CGFloat margin = self.view.height;
	margin -= self.bigButton.height;
	margin -= self.smallButton.height;
	margin -= self.volumeView.height;
	margin /= 4;
	
	self.bigButton.minY = margin;
	self.smallButton.minY = self.bigButton.maxY + margin;
	self.volumeView.minY = self.smallButton.maxY + margin;
}

- (void)volumeViewDidChangeVolume:(ICMCVolumeView *)volumeView {
	self.bigButton.titleForDeselectNormal = [NSString stringWithFormat:@"设置音量\n%lu%%", volumeView.volume];
}

- (ICMCVolumeView *)volumeView {
	if (!_volumeView) {
		_volumeView = [ICMCVolumeView new];
		_volumeView.delegate = self;
	}
	return _volumeView;
}

@end
