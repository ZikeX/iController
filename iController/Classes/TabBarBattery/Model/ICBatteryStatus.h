//
//  ICBatteryStatus.h
//  iController
//
//  Created by 吴双 on 16/2/5.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ICBatteryUnknow		255
#define ICLeaveTimeUnknow	-1

/** 交流电状态 */
typedef NS_ENUM(NSUInteger, ICBatteryACLineStatus) {
	/** 电源断开 */
	ICBatteryACLineStatusBreak = 0,
	/** 电源正常 */
	ICBatteryACLineStatusNormal = 1,
	/** 电源未知 */
	ICBatteryACLineStatusUnknow = ICBatteryUnknow,
};

/** 电池状态 */
typedef NS_ENUM(NSUInteger, ICBatteryFlagOption) {
	/** 电量充足 */
	ICBatteryFlagOptionAbundant = 1,
	/** 电量低 */
	ICBatteryFlagOptionLow = 2,
	/** 电池基本耗尽 */
	ICBatteryFlagOptionExhaust = 4,
	/** 充电 */
	ICBatteryFlagOptionCharging = 8,
	/** 没有电池 */
	ICBatteryFlagOptionNoBattery = 128,
	/** 电池未知 */
	ICBatteryFlagOptionUnknow = ICBatteryUnknow,
};

@interface ICBatteryStatus : NSObject

/** 交流电状态 */
@property (nonatomic, assign) ICBatteryACLineStatus ACLineStatus;

/** 电池状态 */
@property (nonatomic, assign) ICBatteryFlagOption flagOption;

/** 所剩电量, ICBatteryUnknow未知 */
@property (nonatomic, assign) NSUInteger leavePercent;

/** 所剩时间(秒), -1未知 */
@property (nonatomic, assign) NSTimeInterval leaveTime;

/** 总共时间(秒), -1未知 */
@property (nonatomic, assign) NSTimeInterval fullLifeTime;

@end





