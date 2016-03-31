//
//  ICMainViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMainViewController.h"
#import "ICGroupTableViewTools.h"
#import "ICTableViewCell.h"
#import "ICMainItem.h"

@interface ICMainViewController ()

@property (nonatomic, strong) NSArray<ICMainItem *> *items;

@end

@implementation ICMainViewController

+ (instancetype)sharedMainViewController {
	static ICMainViewController *_sharedMainViewController = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedMainViewController = [[self alloc] init];
	});
	return _sharedMainViewController;
}

- (instancetype)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
//	self = [super init];
	if (self) {
		self.title = NSLocalizedString(@"TabBar.Main.Title", nil);
		self.navigationItem.title = self.title;
		self.tabBarItem.title = self.title;
		self.tabBarItem.image = [[UIImage imageNamed:@"tabbar_main_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
		self.tabBarItem.selectedImage = [[UIImage imageNamed:@"tabbar_main_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (ICTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"identifier";
	ICTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[ICTableViewCell alloc] initWithReuseIdentifier:identifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	[cell setIndexPath:indexPath withTableView:tableView];
	cell.textLabel.text = self.items[indexPath.section].titleForCell;
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return self.items[section].titleForHeader;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	return self.items[section].titleForFooter;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSString *ViewControllerName = self.items[indexPath.section].classForController;
	Class ViewController = NSClassFromString(ViewControllerName);
	UIViewController *viewController = [[ViewController alloc] init];
	[self.navigationController pushViewController:viewController animated:YES];
}

- (NSString *)titleForIndexPath:(NSIndexPath *)indexPath {
	NSArray *titles = @[@"显示器", @"鼠标呼吸灯", @"音量", @"自动关机"];
	NSString *title = titles[indexPath.section];
	if (indexPath.row == 0) {
		title = [@"打开" stringByAppendingString:title];
	} else if (indexPath.row == 1) {
		title = [@"关闭" stringByAppendingString:title];
	}
	return title;
}

- (NSArray<ICMainItem *> *)items {
	if (!_items) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"MainItems" ofType:@"plist"];
		_items = [ICMainItem mj_objectArrayWithFile:path];
	}
	return _items;
}

@end
