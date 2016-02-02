//
//  AppDelegate.h
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICTabBarViewController.h"

@interface ICAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong, readonly) ICTabBarViewController *tabBarViewController;

+ (instancetype)sharedDelegate;

@end

