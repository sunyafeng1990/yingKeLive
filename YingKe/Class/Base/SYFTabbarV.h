//
//  SYFTabbarV.h
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/8.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,SYFItemType){
    SYFItemTypeLaunch = 10,//启动直播
    SYFItemTypeLive = 100,//展示直播
    SYFItemTypeMe,//我的

    
};

@class SYFTabbarV;

typedef void(^TabbarBlock)(SYFTabbarV *tabbar,SYFItemType idx);
@protocol SYFTabbarVDelegate <NSObject>

- (void)tabbar:(SYFTabbarV *)tabbar clickButton:(SYFItemType)index;

@end

@interface SYFTabbarV : UIView

@property(nonatomic,weak) id <SYFTabbarVDelegate>delegate;

@property(nonatomic,copy) TabbarBlock  block;
@end
