//
//  ICServiceViewController.m
//  iController
//
//  Created by 吴双 on 16/2/2.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICServiceViewController.h"
#import "MUBottomPopNumberPickerView.h"
#import "ICPortCalculator.h"
#import "ICGroupTableViewTools.h"
#import "ICServiceItem.h"

#define IP_MaxValue		@[@(255), @(255), @(255), @(255)]
#define Port_MaxValue	@[@(6), @(9), @(9), @(9), @(9)]


@interface ICServiceViewController ()
{
	ICProfileAddressCell	*_addressCell;
	ICProfilePortCell		*_portCell;
	ICProfileTimeoutCell	*_timeoutCell;
}

@property (nonatomic, strong) NSArray<ICServiceItem *> *items;

@end

@implementation ICServiceViewController

- (instancetype)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.title = @"服务器设置";
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.tableView.backgroundColor = Const_Color_Background;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return section == [self numberOfSectionsInTableView:tableView] - 1 ? 0 : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (indexPath.section < 3) {
		switch (indexPath.section) {
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

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section < [self numberOfSectionsInTableView:tableView]) {
		return self.items[section].titleForFooter;
	}
	return nil;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if (indexPath.section < 3) {
		if (indexPath.section == 0) {
			[self responseForAddress];
		} else if (indexPath.section == 1) {
			[self responseForPort];
		} else if (indexPath.section == 2) {
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
	[MUBottomPopNumberPickerView showWithMaxValues:Port_MaxValue
									 selectedIndex:[ICPortCalculator arrayFromPort:port]
									animatedOption:MUBottomPopViewAnimatedOptionRebound
									  certainBlock:^(BOOL ok,
													 NSArray<NSNumber *> *maxValues,
													 NSArray<NSNumber *> *selectedIndexes) {
										  if (ok) {
											  NSUInteger port = [ICPortCalculator portFromArray:selectedIndexes];
											  if (port <= 65535) {
												  ICUserDefaults.port = [ICPortCalculator portFromArray:selectedIndexes];
												  self.portCell.port = ICUserDefaults.port;
											  } else {
												  UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"端口错误" message:@"端口最大不能超过65535" preferredStyle:UIAlertControllerStyleAlert];
												  [alert addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil]];
												  [self presentViewController:alert animated:YES completion:nil];
											  }
											  
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
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
		SetCellBackgroundView(_addressCell, self.tableView, indexPath);
	}
	return _addressCell;
}

- (ICProfilePortCell *)portCell {
	if (!_portCell) {
		_portCell = [ICProfilePortCell new];
		_portCell.port = ICUserDefaults.port;
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:1];
		SetCellBackgroundView(_portCell, self.tableView, indexPath);
	}
	return _portCell;
}

- (ICProfileTimeoutCell *)timeoutCell {
	if (!_timeoutCell) {
		_timeoutCell = [ICProfileTimeoutCell new];
		_timeoutCell.timeout = ICUserDefaults.timeout;
		NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:2];
		SetCellBackgroundView(_timeoutCell, self.tableView, indexPath);
	}
	return _timeoutCell;
}

- (NSArray<ICServiceItem *> *)items {
	if (!_items) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"ServiceList" ofType:@"plist"];
		_items = [ICServiceItem mj_objectArrayWithFile:path];
	}
	return _items;
}

@end
