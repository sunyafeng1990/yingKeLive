//
//  SYFNearLiveCell.h
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/11.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SYFLive.h"
@interface SYFNearLiveCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *HeaderView;
@property (strong, nonatomic)  UILabel *distanceLabel;

@property(nonatomic,strong) SYFLive *live;

-(void)showAnimation;


@end
