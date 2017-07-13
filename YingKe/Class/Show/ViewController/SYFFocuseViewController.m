//
//  SYFFocuseViewController.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/10.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFFocuseViewController.h"

@interface SYFFocuseViewController ()

@end

@implementation SYFFocuseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIImageView *imageV  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"臭美.jpg"]];
    imageV.frame = CGRectMake(0, 0, KScreen_Width, kScreenHeight - 64 - 49);
    [self.view addSubview:imageV];
    
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
