//
//  ICUserDefaults.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICUserDefaults.h"

@implementation NSUserDefaults (Service)

#define Const_Key_Service_Address	@"unique.iController.Service.Address"
#define Const_Key_Service_Port		@"unique.iController.Service.Port"
#define Const_Key_Service_Timeout	@"unique.iController.Service.Timeout"

#pragma mark - Setter

- (void)setAddress:(NSString *)address {
	[self setObject:address forKey:Const_Key_Service_Address];
	[self synchronize];
}

- (void)setPort:(NSUInteger)port {
	[self setInteger:port forKey:Const_Key_Service_Port];
	[self synchronize];
}

- (void)setTimeout:(NSUInteger)timeout {
	[self setInteger:timeout forKey:Const_Key_Service_Timeout];
	[self synchronize];
}

#pragma mark - Getter;

- (NSString *)address {
	return [self objectForKey:Const_Key_Service_Address];
}

- (NSUInteger)port {
	return [self integerForKey:Const_Key_Service_Port];
}

- (NSUInteger)timeout {
	return [self integerForKey:Const_Key_Service_Timeout];
}

#undef Const_Key_Service_Address
#undef Const_Key_Service_Port
#undef Const_Key_Service_Timeout

@end
