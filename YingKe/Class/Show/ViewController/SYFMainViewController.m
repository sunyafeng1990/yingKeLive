//
//  SYFMainViewController.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/8.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFMainViewController.h"
#import "SYFMainTopView.h"
@interface SYFMainViewController ()<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *contentScroll;

@property(nonatomic,copy) NSArray *dataList;
@property(nonatomic,strong) SYFMainTopView *topView;
@end

@implementation SYFMainViewController
#pragma mark - lzd
- (NSArray *)dataList{
    if (!_dataList) {
        _dataList = @[@"关注",@"热门",@"附近"];
    }
    return _dataList;
}
- (SYFMainTopView *)topView{
    if (!_topView) {
        _topView = [[SYFMainTopView alloc]initWithFrame:CGRectMake(0, 0, 200, 50) titleNames:self.dataList];
        @weakify(self);
        _topView.block = ^(NSInteger tag) {
            @strongify(self);
            CGPoint point = CGPointMake(tag *KScreen_Width, self.contentScroll.contentOffset.y);
            [self.contentScroll setContentOffset:point animated:YES];
        };
        
    }
    return _topView;
}

- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initUI];
}

#pragma mark - - 加载导航栏按钮
- (void)initUI{
    
    [self.view addSubview:self.contentScroll];
    
    [self setupNav];
    //添加子视图控制器
    [self setupChildViewControllers];
    
}
- (void)setupChildViewControllers{
    
    NSArray *vcNames = @[@"SYFFocuseViewController",@"SYFHotViewController",@"SYFNearViewController"];
    
    for (NSInteger i = 0; i< vcNames.count; i++) {
        NSString *vcName = vcNames[i];
        UIViewController *vc = [[NSClassFromString(vcName) alloc]init];
        vc.title = self.dataList[i];
        // 当执行这句话 addChildViewController  的时候,不会执行该VC 的viewdidload
        [self addChildViewController:vc];
        
    }
    self.contentScroll.contentSize = CGSizeMake(KScreen_Width *self.dataList.count, 0);
    // 默认展示第二个界面
    self.contentScroll.contentOffset = CGPointMake(KScreen_Width, 0);
    // 进入主控制器加载第一个页面
    [self scrollViewDidEndScrollingAnimation:self.contentScroll];
}
#pragma mark - - 加载导航栏按钮
- (void)setupNav{
    
    self.navigationItem.titleView = self.topView;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"global_search"] style:UIBarButtonItemStyleDone target:self action:@selector(searchClick)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"title_button_more"] style:UIBarButtonItemStyleDone target:self action:@selector(messageClick)];
 
}
#pragma mark -- 导航消息按钮
- (void)messageClick{
    NSLog(@"导航消息按钮、、、、");
}
#pragma mark -- 导航搜索按钮
- (void)searchClick{
    NSLog(@"导航搜索按钮、、、、");
}

#pragma mark - -scrollView代理
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    CGFloat width = KScreen_Width;
    
    CGFloat height = KScreen_Height - 64 - 49;
    CGFloat offset = scrollView.contentOffset.x;
    
    NSInteger idx = offset / width;
    //索引值联动topView
    [self.topView scrolling:idx];
    
    //根据索引值返回vc引用
    UIViewController * vc = self.childViewControllers[idx];
    //判断当前vc是否执行过viewdidLoad
    if ([vc isViewLoaded])return;
    
    //设置子控制器view的大小
    vc.view.frame = CGRectMake(offset, 0, scrollView.frame.size.width, height);
    //将子控制器的view加入scrollview上
    [scrollView addSubview:vc.view];
    
}
//减速结束时 调用加载子控制器View
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}


@end
