//
//  ICMainViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMainViewController.h"

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
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		self.title = NSLocalizedString(@"TabBar.Main.Title", nil);
		self.navigationItem.title = self.title;
		self.tabBarItem.title = self.title;
		self.tabBarItem.image = [UIImage imageNamed:@"tabbar_main"];
		self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_main_selected"];
	}
	return self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 0;
}

@end
