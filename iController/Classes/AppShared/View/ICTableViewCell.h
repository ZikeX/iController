//
//  ICTableViewCell.h
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICTableViewCell : UITableViewCell

+ (instancetype)cellForTableView:(UITableView *)tableView;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier;

@end
