//
//  SYFNearLiveCell.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/11.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFNearLiveCell.h"
#import "UIImageView+SDWebImage.h"
@interface SYFNearLiveCell()



@end

@implementation SYFNearLiveCell
-(UIImageView *)HeaderView{
    if (!_HeaderView) {
        _HeaderView = [[UIImageView alloc]init];
//                       WithImage:[UIImage imageNamed:@"爱好"]];
        _HeaderView.contentMode = UIViewContentModeScaleAspectFill;
        _HeaderView.clipsToBounds = YES;
        [self addSubview:_HeaderView];
    }
    return _HeaderView;
}
-(UILabel *)distanceLabel{
    if (!_distanceLabel) {
        _distanceLabel = [[UILabel alloc]init];
        _distanceLabel.textColor = [UIColor orangeColor];
        _distanceLabel.font = [UIFont systemFontOfSize:14.0f];
        _distanceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_distanceLabel];
    }
    return _distanceLabel;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpConstraints];
    
    }
    return self;
}
-(void)setUpConstraints
{
 
    __weak typeof(self)weakSelf = self;
    [self.HeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.left.mas_equalTo(0);

        make.size.mas_equalTo(CGSizeMake(100, 100));
    
     }];
    
    
    [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.HeaderView.mas_bottom).offset(0);
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(20);
    }];
    
    
    
}
- (void)awakeFromNib {
    
    [super awakeFromNib];

}
- (void)setLive:(SYFLive *)live
{
    _live = live;
    self.HeaderView.image = [UIImage imageNamed:@"爱好"];
   self.distanceLabel.text = live.distance;
    
}

-(void)showAnimation{
    if (self.live.isShow) {
        return;
    }
    
    self.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
    
    [UIView animateWithDuration:0.5 animations:^{
        
        self.layer.transform = CATransform3DMakeScale(1, 1, 1);
        
        self.live.show = YES;
        
    }];

    
}
@end
