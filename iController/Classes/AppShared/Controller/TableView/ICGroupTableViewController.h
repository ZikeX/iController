//
//  ICGroupTableViewController.h
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICTableViewCell.h"

@interface ICGroupTableViewController : UITableViewController

- (instancetype)initWithDescription:(NSString *)description;

- (ICTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

@end
