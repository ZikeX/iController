//
//  ICPortCalculator.m
//  iController
//
//  Created by 吴双 on 16/2/2.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICPortCalculator.h"

@implementation ICPortCalculator

+ (NSUInteger)portFromArray:(NSArray *)array {
	NSUInteger port = 0;
	for (NSNumber *number in array) {
		char i = number.intValue;
		port = port * 10 + i;
	}
	return port;
}

+ (NSArray *)arrayFromPort:(NSUInteger)port {
	NSMutableArray *array = [NSMutableArray array];
	while (port) {
		[array insertObject:@(port % 10) atIndex:0];
		port /= 10;
	}
	return [array copy];
}

@end
