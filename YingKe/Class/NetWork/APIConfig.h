//
//  APIConfig.h
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/11.
//  Copyright © 2017年 LeiMo. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface APIConfig : NSObject
//信息类
#define Server_HOST @"http://service.ingkee.com"

// 图片服务器地址
#define Image_HOST @"http://img.meelive.cn/"

//热门直播
#define API_HOTLIVE @"api/live/gettop"

//附近的人
#define API_NearLive @"api/live/near_recommend"
//广告地址
#define API_Advertise @"advertise/get"

//欢哥直播地址
#define Live_Dahuan @"rtmp://live.hkstv.hk.lxdns.com:1935/live/dahuan"

@end
