//
//  ICHelpListBundle.m
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICHelpListBundle.h"

@implementation ICHelpListBundle

+ (NSDictionary *)mj_objectClassInArray {
	NSMutableDictionary *guide = [NSMutableDictionary dictionary];
	guide[@"itemsForiOS"] = [ICHelpListItem class];
	guide[@"itemsForWindows"] = [ICHelpListItem class];
	return guide;
}

- (NSArray *)itemsArray {
	return @[self.itemsForiOS, self.itemsForWindows];
}

- (NSArray<NSString *> *)titlesForHeader {
	return @[self.titleForiOS, self.titleForWindows];
}

@end
