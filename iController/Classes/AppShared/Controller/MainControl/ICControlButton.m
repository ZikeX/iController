//
//  ICControlButton.m
//  iController
//
//  Created by 吴双 on 16/2/7.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICControlButton.h"

@implementation ICControlButton

- (instancetype)init {
	self = [super init];
	if (self) {
		[self setupUserInterface];
		[self sizeToFit];
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self setupUserInterface];
	}
	return self;
}

- (void)setupUserInterface {
	self.backgroundImageForDeselectNormal = [UIImage imageNamed:@"button_normal"];
	self.backgroundImageForDeselectHighlighted = [UIImage imageNamed:@"button_highlight"];
	self.titleColorForDeselectNormal = Const_Color_Title;
}

@end
