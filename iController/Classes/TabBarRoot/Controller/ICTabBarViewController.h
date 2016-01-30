//
//  ICTabBarViewController.h
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICMainViewController.h"
#import "ICDeviceViewController.h"
#import "ICBatteryViewController.h"
#import "ICProfileViewController.h"

@interface ICTabBarViewController : UITabBarController

@property (nonatomic, strong) ICMainViewController *mainViewController;

@property (nonatomic, strong) ICDeviceViewController *deviceViewController;

@property (nonatomic, strong) ICBatteryViewController *batteryViewController;

@property (nonatomic, strong) ICProfileViewController *profileViewController;

+ (instancetype)sharedTabBarController;

@end
