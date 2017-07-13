//
//  SYFLiveHandler.h
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/11.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFBaseHandler.h"

@interface SYFLiveHandler : SYFBaseHandler

/** 获取热门直播信息*/
+ (void)executeGetHotliveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;


/**
 *  获取附近的直播信息
 */

+ (void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

/**
 *  获取广告页
 */

+ (void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed;

@end
