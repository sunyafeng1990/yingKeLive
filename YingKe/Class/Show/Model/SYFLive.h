//
//  SYFLive.h
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/11.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SYFCreator.h"

@interface SYFLive : NSObject

@property (nonatomic, strong) NSString * city;
@property (nonatomic, strong) SYFCreator * creator;
@property (nonatomic, assign) NSInteger group;
@property (nonatomic, strong) NSString * ID;
@property (nonatomic, strong) NSString * image;
@property (nonatomic, assign) NSInteger link;
@property (nonatomic, assign) NSInteger multi;
@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger onlineUsers;
@property (nonatomic, assign) NSInteger optimal;
@property (nonatomic, assign) NSInteger pubStat;
@property (nonatomic, assign) NSInteger roomId;
@property (nonatomic, assign) NSInteger rotate;
@property (nonatomic, strong) NSString * shareAddr;
@property (nonatomic, assign) NSInteger slot;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, strong) NSString * streamAddr;
@property (nonatomic, assign) NSInteger version;

@property (nonatomic, copy) NSString * distance;

@property (nonatomic, getter=isShow) BOOL show;
@end
