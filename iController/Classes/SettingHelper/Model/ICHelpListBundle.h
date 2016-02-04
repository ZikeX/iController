//
//  ICHelpListBundle.h
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICHelpListItem.h"

@interface ICHelpListBundle : NSObject

@property (nonatomic, copy) NSString *titleForiOS;

@property (nonatomic, copy) NSString *titleForWindows;

@property (nonatomic, strong) NSArray<ICHelpListItem *> *itemsForiOS;

@property (nonatomic, strong) NSArray<ICHelpListItem *> *itemsForWindows;

- (NSArray<NSArray<ICHelpListItem *> *> *)itemsArray;

- (NSArray<NSString *> *)titlesForHeader;

@end
