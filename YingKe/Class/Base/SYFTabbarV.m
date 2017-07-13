//
//  SYFTabbarV.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/8.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFTabbarV.h"

@interface SYFTabbarV()

@property (nonatomic,strong)UIImageView *TabbgView;

@property(nonatomic,strong) NSArray *dataList;

@property(nonatomic,strong) UIButton *lastItem;
/** 直播按钮 */
@property(nonatomic,strong) UIButton *camerBtn;

@end


@implementation SYFTabbarV
- (UIImageView *)TabbgView{
    if (!_TabbgView) {
        _TabbgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"global_tab_bg"]];
    }
    return _TabbgView;
}
- (NSArray *)dataList
{
    if (!_dataList) {
        _dataList = @[@"tab_live",@"tab_me"];
    }
    return _dataList;
}
- (UIButton *)camerBtn{
    if (!_camerBtn) {
        _camerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_camerBtn setImage:[UIImage imageNamed:@"tab_launch"] forState:UIControlStateNormal];
        [_camerBtn sizeToFit];
        _camerBtn.tag = SYFItemTypeLaunch;
        [_camerBtn addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _camerBtn;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //背景
         [self addSubview:self.TabbgView];
        //自定义tabbar
        for (NSInteger i = 0; i< self.dataList.count; i++) {
            UIButton * item = [UIButton buttonWithType:UIButtonTypeCustom];
            // 不让图片在高亮状态下改变
            item.adjustsImageWhenHighlighted = NO;
            
            [item setImage:[UIImage imageNamed:self.dataList[i]] forState:UIControlStateNormal];
            [item setImage:[UIImage imageNamed:[self.dataList[i] stringByAppendingString:@"_p"]] forState:UIControlStateSelected];
            [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
            item.tag = SYFItemTypeLive + i;
            if ( i == 0) {
                item.selected = YES;
                self.lastItem = item;
            }
            [self addSubview:item];
            
        }
        
        // 添加 直播按钮
        [self addSubview:self.camerBtn];
      
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.TabbgView.frame = self.bounds;
    
    CGFloat width = self.bounds.size.width / self.dataList.count;
    // 遍历元素,加载frame
    
    for (NSInteger i = 0; i< [self subviews].count; i++) {
        
         UIView * btn = [self subviews][i];
        
        if ([btn isKindOfClass:[UIButton class]]) {
            
            btn.frame = CGRectMake( (btn.tag - SYFItemTypeLive) * width,0 ,width,self.bounds.size.height);
        }
        
    }
    //直播按钮
    [self.camerBtn sizeToFit];
    self.camerBtn.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height  - 40);

    
    
}
- (void)clickItem:(UIButton *)item{
    if ([self.delegate respondsToSelector:@selector(tabbar: clickButton:)]) {
        [self.delegate tabbar:self clickButton:item.tag];
    }
    //代理 和block  选其一
//    !self.block?:self.block(self, item.tag);
    if (self.block) {
        self.block(self, item.tag);
    }
    
    if (item.tag == SYFItemTypeLaunch) {
       //点击直播按钮的时候
        return;
    }
    
    self.lastItem.selected = NO;
    item.selected = YES;
    self.lastItem = item;
    // 设置动画
    [UIView animateWithDuration:0.2 animations:^{
        //将按钮 扩大1.2 倍
        item.transform = CGAffineTransformMakeScale(1.2, 1.2);
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 animations:^{
            //回复原始状态
            item.transform = CGAffineTransformIdentity;
        }];
        
    }];
    
    
    
}
@end
