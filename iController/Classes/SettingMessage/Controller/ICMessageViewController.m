//
//  ICMessageViewController.m
//  iController
//
//  Created by 吴双 on 16/2/2.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMessageViewController.h"
#import "ICTableViewCell.h"

@interface ICMessageViewController ()

@end

@implementation ICMessageViewController

- (instancetype)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.title = @"消息设置";
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
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		UISwitch *on = [UISwitch new];
		on.onTintColor = Const_Color_Title;
		cell.accessoryView = on;;
	}
	[cell setIndexPath:indexPath withTableView:tableView];
	NSArray *titles = @[@"低电量推送", @"新设备推送"];
	cell.textLabel.text = titles[indexPath.section];
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section == 0) {
		return @"当笔记本使用电池并且低于一定量的时候主动提醒";
	} else if (section == 1) {
		return @"当有新的设备连接到WiFi时主动提醒";
	}
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
