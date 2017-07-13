//
//  SYFMainTopView.h
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/10.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MainTopBlock)(NSInteger tag);

@interface SYFMainTopView : UIView

/** 传一个标题*/
- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles;

/** 回传按钮tag值,做联动效果*/
@property(nonatomic,copy) MainTopBlock block;

/** 控制器ScrollVeiw 滑动时候 提供一个 关联方法*/
-(void)scrolling:(NSInteger)tag;

@end
