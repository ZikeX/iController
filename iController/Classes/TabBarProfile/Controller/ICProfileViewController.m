//
//  ICProfileViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICProfileViewController.h"
#import "MUBottomPopNumberPickerView.h"

#define IP_MaxValue @[@(255), @(255), @(255), @(255)]

@interface ICProfileViewController ()
{
	ICProfileAddressCell	*_addressCell;
	ICProfilePortCell		*_portCell;
	ICProfileTimeoutCell	*_timeoutCell;
}

@end

@implementation ICProfileViewController

+ (instancetype)sharedProfileViewController {
	static ICProfileViewController *_sharedProfileViewController = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedProfileViewController = [[self alloc] init];
	});
	return _sharedProfileViewController;
}

- (instancetype)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.title = NSLocalizedString(@"TabBar.Profile.Title", nil);
		self.navigationItem.title = self.title;
		self.tabBarItem.title = self.title;
		self.tabBarItem.image = [UIImage imageNamed:@"tabbar_profile"];
		self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_profile_selected"];
	}
	return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section == 0) {
		switch (indexPath.row) {
			case 0:
				return self.addressCell;
			case 1:
				return self.portCell;
			case 2:
				return self.timeoutCell;
			default:
				break;
		}
	}
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
	}
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if (indexPath.section == 0) {
		if (indexPath.row == 0) {
			[self responseForAddress];
		} else if (indexPath.row == 1) {
			[self responseForPort];
		} else if (indexPath.row == 2) {
			[self responseForTimeout];
		}
	}
}

#pragma mark - Table view cell response

- (void)responseForAddress {
	NSArray<NSString *> *ip = [ICUserDefaults.address componentsSeparatedByString:@"."];
	if (ip.count != 4) {
		ip = nil;
	}
	NSMutableArray<NSNumber *> *selectedIndex = [NSMutableArray array];
	for (int i = 0; i < ip.count; i++) {
		[selectedIndex addObject:@(ip[i].integerValue)];
	}
	[MUBottomPopNumberPickerView showWithMaxValues:IP_MaxValue
									 selectedIndex:selectedIndex
									animatedOption:MUBottomPopViewAnimatedOptionRebound
									  certainBlock:^(BOOL ok,
													 NSArray<NSNumber *> *maxValues,
													 NSArray<NSNumber *> *selectedIndexes) {
										  if (ok) {
											  ICUserDefaults.address = [NSString stringWithFormat:@"%@.%@.%@.%@",
																		selectedIndexes[0],
																		selectedIndexes[1],
																		selectedIndexes[2],
																		selectedIndexes[3]];
											  self.addressCell.address = ICUserDefaults.address;
										  }
	}];
}

- (void)responseForPort {
	NSUInteger port = ICUserDefaults.port;
	if (port == 0) {
		port = 19730;
	}
	[MUBottomPopNumberPickerView showWithMaxValues:@[@(65535)]
									 selectedIndex:@[@(port)]
									animatedOption:MUBottomPopViewAnimatedOptionRebound
									  certainBlock:^(BOOL ok,
													 NSArray<NSNumber *> *maxValues,
													 NSArray<NSNumber *> *selectedIndexes) {
										  if (ok) {
											  ICUserDefaults.port = selectedIndexes.firstObject.intValue;
											  self.portCell.port = ICUserDefaults.port;
										  }
	}];
}

- (void)responseForTimeout {
	NSUInteger timeout = ICUserDefaults.timeout;
	if (timeout == 0) {
		timeout = 3;
	}
	[MUBottomPopNumberPickerView showWithMaxValues:@[@(60)]
									 selectedIndex:@[@(timeout)]
									animatedOption:MUBottomPopViewAnimatedOptionRebound
									  certainBlock:^(BOOL ok,
													 NSArray<NSNumber *> *maxValues,
													 NSArray<NSNumber *> *selectedIndexes) {
										  if (ok) {
											  ICUserDefaults.timeout = selectedIndexes.firstObject.intValue;
											  self.timeoutCell.timeout = ICUserDefaults.timeout;
										  }
	}];
}

- (ICProfileAddressCell *)addressCell {
	if (!_addressCell) {
		_addressCell = [ICProfileAddressCell new];
		_addressCell.address = ICUserDefaults.address;
	}
	return _addressCell;
}

- (ICProfilePortCell *)portCell {
	if (!_portCell) {
		_portCell = [ICProfilePortCell new];
		_portCell.port = ICUserDefaults.port;
	}
	return _portCell;
}

- (ICProfileTimeoutCell *)timeoutCell {
	if (!_timeoutCell) {
		_timeoutCell = [ICProfileTimeoutCell new];
		_timeoutCell.timeout = ICUserDefaults.timeout;
	}
	return _timeoutCell;
}

@end
