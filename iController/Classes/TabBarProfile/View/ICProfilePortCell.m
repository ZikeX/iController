//
//  ICProfilePortCell.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICProfilePortCell.h"

@interface ICProfilePortCell ()
@end

@implementation ICProfilePortCell

- (instancetype)init {
	self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"port"];
	if (self) {
		self.textLabel.text = @"服务器端口";
	}
	return self;
}

- (void)setPort:(NSUInteger)port {
	self.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)port];
}

- (NSUInteger)port {
	return self.detailTextLabel.text.intValue;
}

@end
