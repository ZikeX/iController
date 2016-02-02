//
//  ICTabBar.m
//  iController
//
//  Created by 吴双 on 16/2/2.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICTabBar.h"

@implementation ICTabBar

- (instancetype)init {
	self = [super init];
	if (self) {
		self.tintColor = [UIColor whiteColor];
		self.backgroundImage = [UIImage imageNamed:@"tabbar_bg"];
		self.shadowImage = [UIImage imageNamed:@"tabbar_bg_shadow"];
		self.selectionIndicatorImage = [UIImage imageNamed:@"tabbar_bg_down"];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	int index = 0;
	CGSize size = CGSizeMake(self.width / 4, self.height);
	for (UIView *view in self.subviews) {
		if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
			view.size = size;
			view.origin = CGPointMake(index*size.width, -1);
			index ++;
		}
	}
}

@end
