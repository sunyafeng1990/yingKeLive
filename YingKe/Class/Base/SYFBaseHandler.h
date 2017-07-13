//
//  SYFBaseHandler.h
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/11.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import <Foundation/Foundation.h>
/** 处理完成事件*/
typedef void(^CompleateBlock)();

/** 处理事件成功*/
typedef void(^SuccessBlock)(id obj);

/** 处理事件失败*/
typedef void(^FailedBlock)(id obj);
@interface SYFBaseHandler : NSObject

@end
