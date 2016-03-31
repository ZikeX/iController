//
//  ICAddressCalulator.m
//  iController
//
//  Created by 吴双 on 16/2/8.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICAddressCalulator.h"

@implementation ICAddressCalulator

+ (NSString *)addressFromArray:(NSArray<NSNumber *> *)array {
	if (array.count == 4) {
		return [NSString stringWithFormat:@"%@.%@.%@.%@", array[0], array[1], array[2], array[3]];
	} else {
		return @"192.168.0.0";
	}
}

+ (NSArray<NSNumber *> *)arrayFromAddress:(NSString *)address {
	NSArray<NSString *> *ip = [address componentsSeparatedByString:@"."];
	if (ip.count != 4) {
		ip = @[@"192", @"168", @"0", @"0"];
	}
	NSMutableArray<NSNumber *> *selectedIndex = [NSMutableArray array];
	for (int i = 0; i < ip.count; i++) {
		[selectedIndex addObject:@(ip[i].integerValue)];
	}
	return [selectedIndex copy];
}

@end
