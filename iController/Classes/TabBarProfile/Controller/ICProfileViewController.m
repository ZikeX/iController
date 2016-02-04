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

#import "ICProfileItem.h"

#define IP_MaxValue @[@(255), @(255), @(255), @(255)]

@interface ICProfileViewController ()
{
	ICProfileAddressCell	*_addressCell;
	ICProfilePortCell		*_portCell;
	ICProfileTimeoutCell	*_timeoutCell;
}

@property (nonatomic, strong) NSArray<ICProfileItem *> *items;

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
	return self.items.count;
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
	cell.textLabel.text = self.items[indexPath.section].titleForCell;
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section < self.items.count) {
		return self.items[section].description;
	}
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	Class ViewController = NSClassFromString(self.items[indexPath.section].classForController);
	UIViewController *viewController = [ViewController new];
	[self.navigationController pushViewController:viewController animated:YES];
}

- (NSArray<ICProfileItem *> *)items {
	if (!_items) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"Profile" ofType:@"plist"];
		_items = [ICProfileItem mj_objectArrayWithFile:path];
	}
	return _items;
}

@end
