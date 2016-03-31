//
//  ICMCVolumeView.m
//  iController
//
//  Created by 吴双 on 16/2/9.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMCVolumeView.h"

@interface ICMCVolumeView ()

@property (nonatomic, strong) UISlider *slider;

@end

@implementation ICMCVolumeView

- (instancetype)init {
	self = [super init];
	if (self) {
		[self addSubview:self.slider];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.slider.frame = self.bounds;
}

- (void)volumeDidChange:(UISlider *)sender {
	if ([self.delegate respondsToSelector:@selector(volumeViewDidChangeVolume:)]) {
		[self.delegate volumeViewDidChangeVolume:self];
	}
}

- (void)setVolume:(NSUInteger)volume {
	self.slider.value = volume / 100.0;
}

- (NSUInteger)volume {
	return (NSUInteger)(self.slider.value * 100);
}

- (UISlider *)slider {
	if (!_slider) {
		_slider = [UISlider new];
		[_slider addTarget:self action:@selector(volumeDidChange:) forControlEvents:UIControlEventValueChanged];
		[_slider setThumbImage:[UIImage imageNamed:@"volume_thumb"] forState:UIControlStateNormal];
		[_slider setMinimumTrackImage:[UIImage imageNamed:@"volume_min"] forState:UIControlStateNormal];
		[_slider setMaximumTrackImage:[UIImage imageNamed:@"volume_max"] forState:UIControlStateNormal];
	}
	return _slider;
}

@end
