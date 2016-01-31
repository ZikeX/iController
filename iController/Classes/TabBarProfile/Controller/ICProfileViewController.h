//
//  ICProfileViewController.h
//  iController
//
//  Created by 吴双 on 16/1/30.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ICProfileAddressCell.h"
#import "ICProfilePortCell.h"
#import "ICProfileTimeoutCell.h"

@interface ICProfileViewController : UITableViewController

@property (nonatomic, strong, readonly) ICProfileAddressCell	*addressCell;
@property (nonatomic, strong, readonly) ICProfilePortCell		*portCell;
@property (nonatomic, strong, readonly) ICProfileTimeoutCell	*timeoutCell;

+ (instancetype)sharedProfileViewController;

@end
