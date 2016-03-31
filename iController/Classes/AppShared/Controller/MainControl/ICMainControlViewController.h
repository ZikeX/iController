//
//  ICMainControlViewController.h
//  iController
//
//  Created by 吴双 on 16/2/7.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ICControlButton.h"

@interface ICMainControlViewController : UIViewController

@property (nonatomic, strong, readonly) ICControlButton *bigButton;
@property (nonatomic, strong, readonly) ICControlButton *smallButton;

- (void)bigButtonDidClick;
- (void)smallButtonDidClick;

@end
