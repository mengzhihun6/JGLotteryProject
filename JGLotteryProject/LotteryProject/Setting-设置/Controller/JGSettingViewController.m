//
//  JGSettingViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGSettingViewController.h"
#import "JGpushViewController.h"
#import "JGHelpViewController.h"

#import "JGSettingCell.h"
#import "JGBlurView.h"


@interface JGSettingViewController ()

@end

@implementation JGSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavButton];
    
    // 手动创建模型数据
    // 第一组
    [self setUpGroup0];
    
    [self setUpGroup1];
    
    [self setUpGroup2];
    
    
}

- (void)setUpNavButton {
    
    self.title = @"设置";
    
    UIBarButtonItem *helpItem = [[UIBarButtonItem alloc] initWithTitle:@"常见问题" style:UIBarButtonItemStylePlain target:self action:@selector(helpClick)];
    helpItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = helpItem;
    
}

//点击了帮助按钮
- (void)helpClick {
    
    JGHelpViewController *helpVC = [[JGHelpViewController alloc] init];

    [self.navigationController pushViewController:helpVC animated:YES];
}



- (void)setUpGroup0 {
  
    //创建组模型
    JGGroupItem *group = [[JGGroupItem alloc] init];
    group.headTitle = @"AAA";
    
    //创建一个数组，描述第0组有多少行
    //创建模型
    JGSettingArrowItem *item = [JGSettingArrowItem itemWithImage:[UIImage imageNamed:@"RedeemCode"] title:@"使用兑换码"];
    group.items = @[item];
    [self.groups addObject:group];
}

- (void)setUpGroup1 {
    
    
    //创建组模型
    JGGroupItem *group = [[JGGroupItem alloc] init];
    group.headTitle = @"BBB";
    
    //创建一个数组，描述第0组有多少行
    //创建模型
    JGSettingArrowItem *item = [JGSettingArrowItem itemWithImage:[UIImage imageNamed:@"MorePush"] title:@"推送和提醒"];
    item.descVc = [JGpushViewController class];
    
    JGSettingSwitchItem *item1 = [JGSettingSwitchItem itemWithImage:[UIImage imageNamed:@"more_homeshake"] title:@"使用摇一摇机选"];
    JGSettingSwitchItem *item2 = [JGSettingSwitchItem itemWithImage:[UIImage imageNamed:@"sound_Effect"] title:@"声音效果"];
    JGSettingSwitchItem *item3 = [JGSettingSwitchItem itemWithImage:[UIImage imageNamed:@"More_LotteryRecommend"] title:@"彩票小助手"];
    
    group.items = @[item, item1, item2, item3];
    [self.groups addObject:group];
    
}

- (void)setUpGroup2 {
  
    //创建组模型
    JGGroupItem *group = [[JGGroupItem alloc] init];
    group.headTitle = @"BBB";
    
    //创建一个数组，描述第0组有多少行
    //创建模型
    JGSettingArrowItem *item = [JGSettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreUpdate"] title:@"检查版本更新"];
    item.optionBlock = ^(NSIndexPath *indexPath) {
      
        JGBlurView *blurV = [[JGBlurView alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [[UIApplication sharedApplication].keyWindow addSubview:blurV];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [blurV removeFromSuperview];
            
        });
        
        [MBProgressHUD showSuccess:@"当前没有最新版本"];
    };
    
    
    JGSettingArrowItem *item1 = [JGSettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreShare"] title:@"分享"];
    JGSettingArrowItem *item2 = [JGSettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreNetease"] title:@"产品推荐"];
    JGSettingArrowItem *item3 = [JGSettingArrowItem itemWithImage:[UIImage imageNamed:@"MoreAbout"] title:@"关于"];
    
    group.items = @[item, item1, item2, item3];
    [self.groups addObject:group];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
