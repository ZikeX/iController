//
//  ICPortCalculator.h
//  iController
//
//  Created by 吴双 on 16/2/2.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICPortCalculator : NSObject

+ (NSUInteger)portFromArray:(NSArray *)array;

+ (NSArray *)arrayFromPort:(NSUInteger)port;

@end
