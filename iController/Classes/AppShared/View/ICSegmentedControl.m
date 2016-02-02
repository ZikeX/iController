//
//  ICSegmentedControl.m
//  iController
//
//  Created by 吴双 on 16/2/2.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICSegmentedControl.h"

@implementation ICSegmentedControl

- (instancetype)initWithItems:(NSArray *)items {
	self = [super initWithItems:items];
	if (self) {
		[self setImage:[UIImage imageNamed:@"btn_display_list.9"] forSegmentAtIndex:0];
	}
	return self;
}

@end
