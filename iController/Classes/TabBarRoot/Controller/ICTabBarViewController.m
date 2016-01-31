
//
//  ICTabBarViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICTabBarViewController.h"
#import "ICNavigationController.h"

@interface ICTabBarViewController ()

@end

@implementation ICTabBarViewController

+ (instancetype)sharedTabBarController {
	static ICTabBarViewController *_sharedTabBarController = nil;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_sharedTabBarController = [[self alloc] init];
	});
	return _sharedTabBarController;
}

- (instancetype)init {
	self = [super init];
	if (self) {
		NSArray *viewControllers = @[self.mainViewController, self.deviceViewController, self.batteryViewController, self.profileViewController];
		NSMutableArray *navigationControllers = [NSMutableArray array];
		for (UIViewController *viewController in viewControllers) {
			ICNavigationController *navigationController = [[ICNavigationController alloc] initWithRootViewController:viewController];
			[navigationControllers addObject:navigationController];
		}
		self.viewControllers = [navigationControllers copy];
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.tabBar setTintColor:[UIColor colorWithRed:0.643 green:0.459 blue:0.353 alpha:1.000]];
	[self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"]];
	[self.tabBar setShadowImage:[UIImage imageNamed:@"tabbar_shadow"]];
}

- (ICMainViewController *)mainViewController {
	if (!_mainViewController) {
		_mainViewController = [ICMainViewController sharedMainViewController];
	}
	return _mainViewController;
}

- (ICDeviceViewController *)deviceViewController {
	if (!_deviceViewController) {
		_deviceViewController = [ICDeviceViewController sharedDeviceViewController];
	}
	return _deviceViewController;
}

- (ICBatteryViewController *)batteryViewController {
	if (!_batteryViewController) {
		_batteryViewController = [ICBatteryViewController sharedBatteryViewController];
	}
	return _batteryViewController;
}

- (ICProfileViewController *)profileViewController {
	if (!_profileViewController) {
		_profileViewController = [ICProfileViewController sharedProfileViewController];
	}
	return _profileViewController;
}

@end
