//
//  ICBatteryViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICBatteryViewController.h"

@interface ICBatteryViewController ()

@end

@implementation ICBatteryViewController

+ (instancetype)sharedBatteryViewController {
	static ICBatteryViewController *_sharedBatteryViewController = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedBatteryViewController = [[self alloc] init];
	});
	return _sharedBatteryViewController;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		self.title = NSLocalizedString(@"TabBar.Battery.Title", nil);
		self.navigationItem.title = self.title;
		self.tabBarItem.title = self.title;
		self.tabBarItem.image = [UIImage imageNamed:@"tabbar_power"];
		self.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_power_selected"];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
