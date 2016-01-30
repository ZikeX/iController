//
//  AppDelegate.m
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICAppDelegate.h"
#import "ICTabBarViewController.h"

@interface ICAppDelegate ()

@end

@implementation ICAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self.window makeKeyAndVisible];
	[[NSBundle mainBundle] localizedStringForKey:@"" value:@"" table:nil];
	return YES;
}

- (UIWindow *)window {
	if (!_window) {
		_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
		_window.backgroundColor = [UIColor whiteColor];
		_window.rootViewController = [ICTabBarViewController sharedTabBarController];
	}
	return _window;
}

@end
