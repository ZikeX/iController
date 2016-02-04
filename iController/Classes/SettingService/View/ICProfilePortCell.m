//
//  ICProfilePortCell.m
//  iController
//
//  Created by 吴双 on 16/2/2.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICProfilePortCell.h"

@implementation ICProfilePortCell

- (instancetype)init {
	self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"timeout"];
	if (self) {
		self.textLabel.text = @"服务器端口";
		self.backgroundColor = [UIColor clearColor];
		self.textLabel.textColor = Const_Color_Title;
		self.detailTextLabel.textColor = Const_Color_Subtitle;
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