//
//  ICGroupTableViewTools.h
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICGroupTableViewTools : NSObject

+ (UIImage *)tableView:(UITableView *)tableView deselectRowBackgroundImageForIndexPath:(NSIndexPath *)indexPath;
+ (UIImage *)tableView:(UITableView *)tableView selectRowBackgroundImageForIndexPath:(NSIndexPath *)indexPath;

@end
