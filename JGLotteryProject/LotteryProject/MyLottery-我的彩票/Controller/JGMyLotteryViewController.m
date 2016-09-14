//
//  JGMyLotteryViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGMyLotteryViewController.h"
#import "JGSettingViewController.h"


@interface JGMyLotteryViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation JGMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = _loginBtn.currentBackgroundImage;
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    
    [_loginBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    UIButton *mm = [UIButton buttonWithType:UIButtonTypeCustom];
    [mm setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [mm setTitle:@"客服" forState:UIControlStateNormal];
    [mm sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:mm];
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"Mylottery_config"] style:0 target:self action:@selector(setting)];
    
}


- (void)setting {
    
    JGSettingViewController *setVC = [[JGSettingViewController alloc] init];
    setVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:setVC animated:YES];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
