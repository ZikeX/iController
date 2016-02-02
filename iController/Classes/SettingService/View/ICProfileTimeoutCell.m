//
//  ICProfileTimeoutCell.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICProfileTimeoutCell.h"

@implementation ICProfileTimeoutCell

- (instancetype)init {
	self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"timeout"];
	if (self) {
		self.textLabel.text = @"服务器超时";
		self.backgroundColor = [UIColor clearColor];
		self.textLabel.textColor = Const_Color_Title;
		self.detailTextLabel.text = @" 秒";
		self.detailTextLabel.textColor = Const_Color_Subtitle;
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.textLabel.midX += 10;
	self.detailTextLabel.midX -= 10;
}

- (void)setTimeout:(NSUInteger)timeout {
	self.detailTextLabel.text = [NSString stringWithFormat:@"%lu 秒", (unsigned long)timeout];
}

- (NSUInteger)timeout {
	return self.detailTextLabel.text.intValue;
}

@end
