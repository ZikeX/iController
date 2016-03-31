//
//  ICMessageViewController.m
//  iController
//
//  Created by 吴双 on 16/2/2.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMessageViewController.h"
#import "ICTableViewCell.h"
#import "ICSwitch.h"

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
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return section == [self numberOfSectionsInTableView:tableView] - 1 ? 0 : 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"identifier";
	ICTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[ICTableViewCell alloc] initWithReuseIdentifier:identifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		ICSwitch *on = [[ICSwitch alloc] initWithStyle:ICSwitchStyleBlue];
		cell.accessoryView = on;
//		UISwitch *on = [UISwitch new];
//		on.onTintColor = Const_Color_Title;
//		cell.accessoryView = on;;
	}
	[cell setIndexPath:indexPath withTableView:tableView];
	NSArray *titles = @[@"低电量推送", @"新设备推送"];
	cell.textLabel.text = titles[indexPath.section];
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section == 0) {
		return @"当笔记本断开交流电并且电池低于一定量的时候主动提醒";
	} else if (section == 1) {
		return @"当有新的设备连接到WiFi时主动提醒, 该功能需要电脑端开启自动刷新设备功能";
	} else if (section == 2) {
		NSString *appName = [[NSBundle mainBundle] infoDictionary][@"CFBundleName"];
		return [NSString stringWithFormat:@"若要接收到推送通知, 请到【设置】->【通知】->【%@】中打开【允许通知】开关", appName];
	}
	return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
