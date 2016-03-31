//
//  ICDeviceGroup.m
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICDeviceGroup.h"

@implementation ICDeviceGroup

+ (NSDictionary *)mj_objectClassInArray {
	return @{
			 @"linking":[ICDeviceItem class],
			 @"saved":[ICDeviceItem class]
			 };
}

@end
