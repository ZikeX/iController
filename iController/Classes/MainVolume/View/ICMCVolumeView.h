//
//  ICMCVolumeView.h
//  iController
//
//  Created by 吴双 on 16/2/9.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICMCVolumeView;

@protocol ICMCVolumeViewDelegate <NSObject>

@optional

- (void)volumeViewDidChangeVolume:(ICMCVolumeView *)volumeView;

@end

@interface ICMCVolumeView : UIView

@property (nonatomic, assign) NSUInteger volume;

@property (nonatomic, weak) id <ICMCVolumeViewDelegate> delegate;

@end
