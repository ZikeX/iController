//
//  ICDeviceViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICDeviceViewController.h"

@interface ICDeviceViewController ()

@end

@implementation ICDeviceViewController

+ (instancetype)sharedDeviceViewController {
	static ICDeviceViewController *_sharedDeviceViewController = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedDeviceViewController = [[self alloc] init];
	});
	return _sharedDeviceViewController;
}

- (instancetype)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.title = NSLocalizedString(@"TabBar.Device.Title", nil);
		self.navigationItem.title = self.title;
		self.tabBarItem.title = self.title;
		self.tabBarItem.image = [UIImage imageNamed:@"tabbar_list"];
		self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_list_selected"];
	}
	return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return @"在线列表";
			break;
		case 1:
			return @"保存列表";
			break;
		default:
			return nil;
			break;
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	switch (section) {
		case 0:
			return @"当前有 0 台设备在线";
			break;
		case 1:
			return @"已保存 0 台设备信息";
			break;
		default:
			return nil;
			break;
	}
}

@end
