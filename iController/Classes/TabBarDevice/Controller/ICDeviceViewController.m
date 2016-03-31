//
//  ICDeviceViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICDeviceViewController.h"
#import "ICDeviceGroup.h"

@interface ICDeviceViewController ()

@property (nonatomic, strong) ICDeviceGroup *group;

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
		self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_device_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
		self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_device_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.tableView.backgroundColor = Const_Color_Background;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
	self.tableView.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{
		[self.tableView.mj_header endRefreshing];
	}];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (section == 0) {
		return self.group.linking.count;
	} else if (section == 1) {
		return self.group.saved.count;
	}
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"Device";
	ICTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[ICTableViewCell alloc] initWithReuseIdentifier:identifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	ICDeviceItem *item = nil;
	if (indexPath.section == 0) {
		item = self.group.linking[indexPath.row];
	} else {
		item = self.group.saved[indexPath.row];
	}
	[cell setIndexPath:indexPath withTableView:tableView];
	cell.textLabel.text = item.name;
	cell.detailTextLabel.text = item.mac;
	return cell;
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
			return [NSString stringWithFormat:@"当前有 %lu 台设备在线", (unsigned long)self.group.linking.count];
			break;
		case 1:
			return [NSString stringWithFormat:@"已保存 %lu 台设备信息", (unsigned long)self.group.saved.count];
			break;
		default:
			return nil;
			break;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	[self.navigationController pushViewController:[UIViewController new] animated:YES];
}

- (ICDeviceGroup *)group {
	if (!_group) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"DeviceItems" ofType:@"plist"];
		_group = [ICDeviceGroup mj_objectWithFile:path];
	}
	return _group;
}

@end
