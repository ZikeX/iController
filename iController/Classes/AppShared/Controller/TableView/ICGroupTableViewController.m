//
//  ICGroupTableViewController.m
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICGroupTableViewController.h"

@interface ICGroupTableViewController ()
{
	NSString *_description;
}

@end

@implementation ICGroupTableViewController

- (instancetype)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
	if (self) {
		
	}
	return self;
}

- (instancetype)initWithDescription:(NSString *)description {
	self = [self init];
	if (self) {
		_description = description;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.tableView.backgroundColor = Const_Color_Background;
	self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - Private method

- (BOOL)hasDescription {
	return _description;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return self.hasDescription ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (ICTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *identifier = @"identifier";
	ICTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
	if (!cell) {
		cell = [[ICTableViewCell alloc] initWithReuseIdentifier:identifier];
	}
	return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
	if (section == [self numberOfSectionsInTableView:tableView] - 1) {
		return _description;
	} else {
		return nil;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
