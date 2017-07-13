//
//  SYFLiveHandler.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/11.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFLiveHandler.h"
#import "SYFLive.h"
@implementation SYFLiveHandler
/** 获取热门直播信息*/
+ (void)executeGetHotliveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    [HttpTool getWithPath:API_HOTLIVE params:nil success:^(id json) {
        
        if (![json[@"dm_error"]integerValue]) {
            failed(json[@"error_msg"]);
        }else{
            success(json);
        }
        
     } failure:^(NSError *error) {
        failed(error);
    }];
    
}
/**
 *  获取附近的直播信息
 */

+ (void)executeGetNearLiveTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
    NSDictionary * params = @{@"uid":@"85149891",
                              @"latitude":@"40.090562",
                              @"longitude":@"116.413353"
                              };
    
    [HttpTool getWithPath:API_NearLive params:params  success:^(id json) {
//        NSLog(@"json---%@",json);
        if ([json[@"dm_error"]integerValue]) {
            failed(json);
            
        }else{
            NSArray * lives = [SYFLive mj_objectArrayWithKeyValuesArray:json[@"lives"]];
            
            success(lives);
        }
        
    } failure:^(NSError *error) {
        failed(error);
        
        
    }];
}

/**
 *  获取广告页
 */

+ (void)executeGetAdvertiseTaskWithSuccess:(SuccessBlock)success failed:(FailedBlock)failed
{
 
    
    
    
}










@end
