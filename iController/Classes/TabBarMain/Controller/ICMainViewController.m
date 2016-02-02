//
//  ICMainViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMainViewController.h"
#import "ICGroupTableViewTools.h"

@interface ICMainViewController ()

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
//	self = [super initWithStyle:UITableViewStyleGrouped];
	self = [super init];
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
	UIImage *image = [UIImage imageNamed:@"button_normal"];
	UIImage *selectedImage = [UIImage imageNamed:@"button_highlight"];
	UIButton *button = [UIButton new];
	button.backgroundImageForDeselectNormal = image;
	button.backgroundImageForDeselectHighlighted = selectedImage;
	button.side = 300;
	[self.view addSubview:button];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"identifier";
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
		cell.backgroundColor = [UIColor clearColor];
	}
	cell.textLabel.text = [self titleForIndexPath:indexPath];
	cell.backgroundView = [[UIImageView alloc] initWithImage:[ICGroupTableViewTools tableView:tableView deselectRowBackgroundImageForIndexPath:indexPath]];
	cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[ICGroupTableViewTools tableView:tableView selectRowBackgroundImageForIndexPath:indexPath]];
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
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

@end
