//
//  ICTableViewCell.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICTableViewCell.h"

@implementation ICTableViewCell

+ (instancetype)cellForTableView:(UITableView *)tableView {
	return [[self alloc] initWithReuseIdentifier:@"TableViewCell"];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
	if (self) {
		
	}
	return self;
}

@end
