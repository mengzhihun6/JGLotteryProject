//
//  JGHallViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGHallViewController.h"

#import "JGCover.h"
#import "JGPopMenu.h"


@interface JGHallViewController ()<JGPopMenuDelegate>

@end

@implementation JGHallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //创建item
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"CS50_activity_image"] style:UIBarButtonItemStylePlain target:self action:@selector(activity)];
    self.navigationItem.leftBarButtonItem = item;
    
    
}

- (void)activity {
   
    //弹出蒙版
    [JGCover show];
    
    //弹出菜单
    JGPopMenu *menu = [JGPopMenu showInPoint:CGPointMake(kDeviceWidth * 0.5, kDeviceHight * 0.5)];
    menu.delegate = self;
    
}


#pragma mark - JGPopMenuDelegate -
- (void)popMenuDidClickClose:(JGPopMenu *)popMenu {
    
    
    [popMenu hideInPoint:CGPointMake(44, 44) completion:^{
       
        [JGCover hide];
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
