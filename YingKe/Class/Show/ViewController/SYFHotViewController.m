//
//  SYFHotViewController.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/10.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFHotViewController.h"
#import "SYFLiveHandler.h"
@interface SYFHotViewController ()

@end

@implementation SYFHotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initUI];
    [self loadData];
    
}
- (void)initUI{
    UIImageView *imageV  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"臭美2"]];
    imageV.frame = CGRectMake(0, 0, KScreen_Width, kScreenHeight - 64 - 49);
    [self.view addSubview:imageV];

}
- (void)loadData{
    [SYFLiveHandler executeGetHotliveTaskWithSuccess:^(id obj) {
        NSLog(@"%@",[obj objectForKey:@"error_msg"]);
        
    } failed:^(id obj) {
        
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
