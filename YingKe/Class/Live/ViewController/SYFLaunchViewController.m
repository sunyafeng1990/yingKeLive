//
//  SYFLaunchViewController.m
//  YingKe
//
//  Created by 孙亚锋 on 2017/7/8.
//  Copyright © 2017年 LeiMo. All rights reserved.
//

#import "SYFLaunchViewController.h"

@interface SYFLaunchViewController ()
@property (weak, nonatomic) IBOutlet UIButton *CloseLaunch;

@end

@implementation SYFLaunchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)ClockLaunch:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
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
