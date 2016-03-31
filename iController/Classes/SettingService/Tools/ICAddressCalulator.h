//
//  ICAddressCalulator.h
//  iController
//
//  Created by 吴双 on 16/2/8.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICAddressCalulator : NSObject

+ (NSString *)addressFromArray:(NSArray<NSNumber *> *)array;

+ (NSArray<NSNumber *> *)arrayFromAddress:(NSString *)address;

@end
