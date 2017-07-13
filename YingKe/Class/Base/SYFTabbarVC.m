//
//  SYFTabbarVC.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/8.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFTabbarVC.h"
#import "SYFTabbarV.h"
#import "SYFBaseNavViewController.h"
#import "SYFLaunchViewController.h"
@interface SYFTabbarVC ()<SYFTabbarVDelegate>

@property(nonatomic,strong) SYFTabbarV *syfTabbar;

@end

@implementation SYFTabbarVC
- (SYFTabbarV *)syfTabbar{
    if (!_syfTabbar) {
        _syfTabbar = [[SYFTabbarV alloc]initWithFrame:CGRectMake(0, 0, KScreen_Width, 49)];
        _syfTabbar.delegate = self;
    }
    return _syfTabbar;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载控制器
    [self configViewControllers];
   
    //加载tabbar
    [self.tabBar addSubview:self.syfTabbar];
    // 删除tabbar阴影线
    [[UITabBar appearance]setShadowImage:[UIImage new]];
    [[UITabBar appearance]setBackgroundImage:[UIImage new]];
  
}
- (void)configViewControllers {
    
    NSMutableArray * array = [NSMutableArray arrayWithObjects:@"SYFMainViewController"
,@"SYFMeViewController", nil];
    for (NSInteger i = 0;i < array.count; i++) {
        NSString *vcName = array[i];
        
        UIViewController * vc = [[NSClassFromString(vcName) alloc]init];
        
        SYFBaseNavViewController * nav = [[SYFBaseNavViewController alloc]initWithRootViewController:vc];
        
        [array replaceObjectAtIndex:i withObject:nav];
        
    }
    self.viewControllers = array;
}
#pragma mark - -自定义tabbar 代理
-(void)tabbar:(SYFTabbarV *)tabbar clickButton:(SYFItemType)index{
    
    if (index != SYFItemTypeLaunch) {
        self.selectedIndex = index - SYFItemTypeLive;
        return;
    }
    //点击相机按钮,开启直播模态视图
    SYFLaunchViewController *launchVC = [[SYFLaunchViewController alloc]init];
    [self presentViewController:launchVC animated:YES completion:nil];
    
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
