//
//  SYFMainTopView.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/10.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFMainTopView.h"

@interface SYFMainTopView()

@property (nonatomic,strong)UIView *lineView;

@property(nonatomic,strong)NSMutableArray *buttons;
@end


@implementation SYFMainTopView
-(NSMutableArray *)buttons{
    if (!_buttons) {
        _buttons = [NSMutableArray array];
    }
    return _buttons;
}
- (instancetype)initWithFrame:(CGRect)frame titleNames:(NSArray *)titles{
    
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat btnWidth  = self.width / titles.count;
        CGFloat btnHeight = self.height;
        
        for (NSInteger i = 0; i<titles.count; i++) {
            UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            NSString *vcName = titles[i];
            [titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [titleBtn setTitle:vcName forState:UIControlStateNormal];
            titleBtn.titleLabel.font = [UIFont systemFontOfSize:18.0f];
            titleBtn.tag = i;
            titleBtn.frame = CGRectMake(i * btnWidth,0,btnWidth, btnHeight);
            [titleBtn addTarget:self action:@selector(titleBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:titleBtn];
            [self.buttons addObject:titleBtn];
          
            
            if ( i == 1) {
                CGFloat h = 2;
                CGFloat y = 40;
                [titleBtn.titleLabel sizeToFit];
                UIView *lineView = [[UIView alloc]init];
                lineView.backgroundColor = [UIColor whiteColor];
                lineView.height = h;
                lineView.width = titleBtn.titleLabel.width;
                lineView.top = y;
                lineView.centerX = titleBtn.centerX;
                [self addSubview:lineView];
                self.lineView = lineView;
                
            }
        }
        
    }
    return self;
}
// mainVC滚动时调用
- (void)scrolling:(NSInteger)tag{
    
    UIButton * button = self.buttons[tag];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.lineView.centerX = button.centerX;
    }];
    
}
//点击事件
-(void)titleBtnClick:(UIButton *)btn{
    self.block(btn.tag);
    
    [self scrolling:btn.tag];
    
}











@end
