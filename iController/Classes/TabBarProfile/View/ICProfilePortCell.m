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
		self.textLabel.textColor = Const_Color_Title;
		self.detailTextLabel.textColor = Const_Color_Subtitle;
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	self.textLabel.midX += 10;
	self.detailTextLabel.midX -= 10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];
	if (selected) {
		
	}
}

- (void)setPort:(NSUInteger)port {
	self.detailTextLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)port];
}

- (NSUInteger)port {
	return self.detailTextLabel.text.intValue;
}

@end
