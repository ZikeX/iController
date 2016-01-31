//
//  ICNavigationController.m
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICNavigationController.h"

@interface ICNavigationController ()

@end

@implementation ICNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav_bg"] forBarMetrics:UIBarMetricsDefault];
	[self.navigationBar setShadowImage:[UIImage imageNamed:@"nav_shadow"]];
}


@end
