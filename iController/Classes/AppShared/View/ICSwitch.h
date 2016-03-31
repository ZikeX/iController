//
//  ICSwitch.h
//  iController
//
//  Created by 吴双 on 16/2/7.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICSwitch;

typedef NS_ENUM(NSUInteger, ICSwitchStyle) {
	ICSwitchStyleBlue,
	ICSwitchStyleRed,
};

typedef NS_ENUM(NSUInteger, ICSwitchStatus) {
	ICSwitchStatusNormal,
	ICSwitchStatusLoading,
	ICSwitchStatusDisable,
};

typedef void(^SwitchValueChanged)(ICSwitch *sender);

@interface ICSwitch : UIView

@property (nonatomic, assign) ICSwitchStyle style;
@property (nonatomic, assign) ICSwitchStatus status;

@property (nonatomic, copy) SwitchValueChanged valueChanged;
@property (nonatomic, assign, getter=isOn) BOOL on;

- (instancetype)initWithStyle:(ICSwitchStyle)style;

@end
