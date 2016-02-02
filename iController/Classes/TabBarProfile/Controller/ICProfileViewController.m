//
//  ICProfileViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICProfileViewController.h"
#import "ICGroupTableViewTools.h"
#import "ICServiceViewController.h"
#import "ICMessageViewController.h"
#import "ICTableViewCell.h"

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
		self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_profile_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
		self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_profile_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.tableView.backgroundColor = Const_Color_Background;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"identifier";
	ICTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[ICTableViewCell alloc] initWithReuseIdentifier:identifier];
	}
	[cell setIndexPath:indexPath withTableView:tableView];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	NSArray *titles = @[@"服务器设置", @"消息设置"];
	cell.textLabel.text = titles[indexPath.section];
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section == 0) {
		return @"修改服务器地址, 端口号, 最长等待时间";
	} else if (section == 1) {
		return @"笔记本低电量消息, 有新设备连接消息";
	}
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if (indexPath.section == 0) {
		[self.navigationController pushViewController:[ICServiceViewController new] animated:YES];
	} else if (indexPath.section == 1) {
		[self.navigationController pushViewController:[ICMessageViewController new] animated:YES];
	}
	
}

@end
