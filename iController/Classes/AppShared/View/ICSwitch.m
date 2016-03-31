//
//  ICSwitch.m
//  iController
//
//  Created by 吴双 on 16/2/7.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICSwitch.h"

@interface ICSwitch ()

@property (nonatomic, strong) UIButton *button;

@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation ICSwitch

- (instancetype)init {
	self = [super init];
	if (self) {
		[self addSubview:self.button];
		[self addSubview:self.activityIndicatorView];
		self.status = ICSwitchStatusNormal;
	}
	return self;
}

- (instancetype)initWithStyle:(ICSwitchStyle)style {
	self = [self init];
	if (self) {
		self.style = style;
	}
	return self;
}

- (void)buttonClick:(UIButton *)sender {
	sender.selected = !sender.isSelected;
	self.status = ICSwitchStatusLoading;
	
	if (self.valueChanged) {
		self.valueChanged(self);
	}
}

- (void)setFrame:(CGRect)frame {
	frame.size = self.button.size;
	[super setFrame:frame];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.button.center = self.midPoint;
	self.activityIndicatorView.center = self.midPoint;
}

- (void)setStyle:(ICSwitchStyle)style {
	_style = style;
	if (style == ICSwitchStyleBlue) {
		self.button.imageForSelectedNormal = [UIImage imageNamed:@"checked_blue"];
	} else {
		self.button.imageForSelectedNormal = [UIImage imageNamed:@"checked"];
	}
}

- (void)setStatus:(ICSwitchStatus)status {
	switch (status) {
		case ICSwitchStatusNormal: {
			[self.button				setEnabled:YES];
			[self.activityIndicatorView stopAnimating];
			[self.button				setHidden:NO];
			break;
		}
		case ICSwitchStatusLoading: {
			[self.button				setEnabled:NO];
			[self.activityIndicatorView startAnimating];
			[self.button				setHidden:YES];
			break;
		}
		case ICSwitchStatusDisable: {
			[self.button				setEnabled:NO];
			[self.activityIndicatorView stopAnimating];
			[self.button				setHidden:NO];
			break;
		}
	}
}

- (void)setOn:(BOOL)on {
	self.button.selected = on;
}

- (BOOL)isOn {
	return self.button.isSelected;
}

- (UIButton *)button {
	if (!_button) {
		_button = [UIButton new];
		[_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
		_button.imageForDeselectNormal = [UIImage imageNamed:@"unchecked"];
		_button.adjustsImageWhenHighlighted = NO;
		[_button sizeToFit];
	}
	return _button;
}

- (UIActivityIndicatorView *)activityIndicatorView {
	if (!_activityIndicatorView) {
		_activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
		_activityIndicatorView.hidesWhenStopped = YES;
	}
	return _activityIndicatorView;
}

@end
