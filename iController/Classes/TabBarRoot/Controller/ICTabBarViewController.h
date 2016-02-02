//
//  ICTabBarViewController.h
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMainViewController.h"
#import "ICDeviceViewController.h"
#import "ICBatteryViewController.h"
#import "ICProfileViewController.h"

@interface ICTabBarViewController : UITabBarController

@property (nonatomic, strong, readonly) ICMainViewController *mainViewController;

@property (nonatomic, strong, readonly) ICDeviceViewController *deviceViewController;

@property (nonatomic, strong, readonly) ICBatteryViewController *batteryViewController;

@property (nonatomic, strong, readonly) ICProfileViewController *profileViewController;

+ (instancetype)sharedTabBarController;

@end
