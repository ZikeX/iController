//
//  ICUserDefaults.h
//  iController
//
//  Created by 吴双 on 16/1/31.
//  Copyright © 2016年 unique. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Service)

@property (nonatomic, strong) NSString *address;
@property (nonatomic, assign) NSUInteger port;
@property (nonatomic, assign) NSUInteger timeout;

@end
