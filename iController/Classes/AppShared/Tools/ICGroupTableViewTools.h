//
//  ICGroupTableViewTools.h
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ICTableViewCell.h"

#define SetCellBackgroundView(c, tv, ip) \
[c setBackgroundViewForTableView:tv indexPath:ip]


typedef NS_ENUM(NSUInteger, ICGroupTableViewRowType) {
	ICGroupTableViewRowTypeSingle,
	ICGroupTableViewRowTypeTop,
	ICGroupTableViewRowTypeMiddle,
	ICGroupTableViewRowTypeButtom,
};


@interface ICGroupTableViewTools : NSObject

+ (UIImage *)tableView:(UITableView *)tableView deselectRowBackgroundImageForIndexPath:(NSIndexPath *)indexPath;
+ (UIImage *)tableView:(UITableView *)tableView selectRowBackgroundImageForIndexPath:(NSIndexPath *)indexPath;

@end



@interface ICTableViewCell (BackgroundView)

- (void)setBackgroundViewForTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath;

@end

