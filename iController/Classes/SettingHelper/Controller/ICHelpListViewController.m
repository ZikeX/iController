//
//  ICHelpListViewController.m
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICHelpListViewController.h"
#import "ICHelpListBundle.h"
#import "ICTableViewCell.h"

#import "ICHTMLBrowerViewController.h"

@interface ICHelpListViewController ()

@property (nonatomic, strong) ICHelpListBundle *bundle;

@end

@implementation ICHelpListViewController

- (instancetype)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.title = @"帮助";
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
	return self.bundle.itemsArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.bundle.itemsArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"identifier";
	ICTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[ICTableViewCell alloc] initWithReuseIdentifier:identifier];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	}
	[cell setIndexPath:indexPath withTableView:tableView];
	cell.textLabelText = self.bundle.itemsArray[indexPath.section][indexPath.row].title;
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section < 2) {
		return self.bundle.titlesForHeader[section];
	} else {
		return nil;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	ICHTMLBrowerViewController *viewController = [[ICHTMLBrowerViewController alloc] initWithFileName:@"index"];
	[self.navigationController pushViewController:viewController animated:YES];
	
	
//	NSString *ViewControllerName = self.bundle.itemsArray[indexPath.section][indexPath.row].url;
//	Class ViewControllerClass = NSClassFromString(ViewControllerName);
//	[self.navigationController pushViewController:[ViewControllerClass new] animated:YES];
}

- (ICHelpListBundle *)bundle {
	if (!_bundle) {
		NSString *path = [[NSBundle mainBundle] pathForResource:@"HelpList" ofType:@"plist"];
		_bundle = [ICHelpListBundle mj_objectWithFile:path];
	}
	return _bundle;
}

@end
