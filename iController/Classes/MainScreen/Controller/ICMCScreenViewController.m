
//
//  ICMCScreenViewController.m
//  iController
//
//  Created by 吴双 on 16/2/7.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICMCScreenViewController.h"

@interface ICMCScreenViewController ()

@end

@implementation ICMCScreenViewController

- (instancetype)init {
	self = [super init];
	if (self) {
		self.title = @"屏幕控制";
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	self.bigButton.titleForDeselectNormal = @"关闭显示器";
	self.smallButton.titleForDeselectNormal = @"打开";
}

@end
