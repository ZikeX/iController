//
//  AppDelegate.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICAppDelegate.h"

@interface ICAppDelegate ()

@end

@implementation ICAppDelegate

+ (instancetype)sharedDelegate {
	return (ICAppDelegate *)[UIApplication sharedApplication].delegate;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self.window makeKeyAndVisible];
	[application registerForRemoteNotifications];
	return YES;
}

- (UIWindow *)window {
	if (!_window) {
		_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
		_window.backgroundColor = [UIColor whiteColor];
		_window.rootViewController = self.tabBarViewController;
	}
	return _window;
}

- (ICTabBarViewController *)tabBarViewController {
	return [ICTabBarViewController sharedTabBarController];
}

@end
