//
//  ICDeviceItem.h
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ICDeviceItemBrand) {
	ICDeviceItemBrandUnknow = 0,
	ICDeviceItemBrandApple = 1,
	ICDeviceItemBrandXiaomi = 10,
	ICDeviceItemBrandMeizu = 20,
	ICDeviceItemBrandLenovo = 30,
	ICDeviceItemBrandSmartian = 40,
	ICDeviceItemBrandHuawei = 50,
	ICDeviceItemBrandSamsung = 60,
};

@interface ICDeviceItem : NSObject

/** 名称 */
@property (nonatomic, copy) NSString *name;

/** Mac地址 */
@property (nonatomic, copy) NSString *mac;

/** 品牌 */
@property (nonatomic, assign) ICDeviceItemBrand brand;

@property (nonatomic, assign, getter=isApple) BOOL apple;

@end
