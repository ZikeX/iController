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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[self.window makeKeyAndVisible];
	return YES;
}

- (UIWindow *)window {
	if (!_window) {
		_window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
		_window.backgroundColor = [UIColor whiteColor];
		_window.rootViewController = [UIViewController new];
	}
	return _window;
}

@end
