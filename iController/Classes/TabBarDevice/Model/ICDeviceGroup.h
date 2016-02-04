//
//  ICDeviceGroup.h
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import "ICDeviceItem.h"

@interface ICDeviceGroup : NSObject

/** 连接中 */
@property (nonatomic, strong) NSArray<ICDeviceItem *> *linking;

/** 已保存 */
@property (nonatomic, strong) NSArray<ICDeviceItem *> *saved;

@end
