//
//  JGpushViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGpushViewController.h"
#import "JGAwardViewController.h"
#import "JGScoreViewController.h"

@interface JGpushViewController ()

@end

@implementation JGpushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 添加第0组
    [self setUpGroup0];
    
    
}

- (void)setUpGroup0 {
    
    //创建组模型
    JGGroupItem *group = [[JGGroupItem alloc] init];
    
    //创建行模型
    JGSettingArrowItem *item = [JGSettingArrowItem itemWithImage:nil title:@"开奖推送"];
    item.descVc = [JGAwardViewController class];
    JGSettingArrowItem *item1 = [JGSettingArrowItem itemWithImage:nil title:@"比分直播推送"];
    item1.descVc = [JGScoreViewController class];
    JGSettingArrowItem *item2 = [JGSettingArrowItem itemWithImage:nil title:@"中奖动画"];
    JGSettingArrowItem *item3 = [JGSettingArrowItem itemWithImage:nil title:@"购彩提醒"];
    
    group.items = @[item, item1, item2, item3];
    
    [self.groups addObject:group];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
