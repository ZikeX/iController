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
		self.detailTextLabel.text = @" 秒";
	}
	return self;
}

- (void)setTimeout:(NSUInteger)timeout {
	self.detailTextLabel.text = [NSString stringWithFormat:@"%lu 秒", (unsigned long)timeout];
}

- (NSUInteger)timeout {
	return self.detailTextLabel.text.intValue;
}

@end
