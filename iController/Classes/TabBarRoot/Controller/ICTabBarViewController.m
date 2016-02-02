
//
//  ICTabBarViewController.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICTabBarViewController.h"
#import "ICNavigationController.h"
#import "ICTabBar.h"

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
		[self setValue:[ICTabBar new] forKey:@"tabBar"];
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
}

- (ICMainViewController *)mainViewController {
	return [ICMainViewController sharedMainViewController];
}

- (ICDeviceViewController *)deviceViewController {
	return [ICDeviceViewController sharedDeviceViewController];
}

- (ICBatteryViewController *)batteryViewController {
	return [ICBatteryViewController sharedBatteryViewController];
}

- (ICProfileViewController *)profileViewController {
	return [ICProfileViewController sharedProfileViewController];
}

@end
