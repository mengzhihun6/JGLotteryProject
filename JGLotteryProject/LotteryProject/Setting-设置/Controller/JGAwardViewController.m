//
//  JGAwardViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGAwardViewController.h"

#import "JGSettingCell.h"

@interface JGAwardViewController ()


@end

@implementation JGAwardViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // 添加第0组
    [self setUpGroup0];
 
}

- (void)setUpGroup0 {
    
    //创建组模型
    JGGroupItem *group = [[JGGroupItem alloc] init];
    
    //创建行模型
    JGSettingSwitchItem *item = [JGSettingSwitchItem itemWithImage:nil title:@"双色球"];
    item.subTitle = @"每周二、四、日开奖";
    JGSettingSwitchItem *item1 = [JGSettingSwitchItem itemWithImage:nil title:@"大乐透"];
    item1.subTitle = @"每周一、三、六开奖";
    JGSettingSwitchItem *item2 = [JGSettingSwitchItem itemWithImage:nil title:@"3D"];
    item2.subTitle = @"每天开奖、包括试机号提醒";
    JGSettingSwitchItem *item3 = [JGSettingSwitchItem itemWithImage:nil title:@"七乐彩"];
    item3.subTitle = @"每周一、三、五开奖";
    JGSettingSwitchItem *item4 = [JGSettingSwitchItem itemWithImage:nil title:@"七星彩"];
    item4.subTitle = @"每周二、五、日开奖";
    JGSettingSwitchItem *item5 = [JGSettingSwitchItem itemWithImage:nil title:@"排列3"];
    item5.subTitle = @"每天开奖";
    JGSettingSwitchItem *item6 = [JGSettingSwitchItem itemWithImage:nil title:@"排列5"];
    item6.subTitle = @"每天开奖";
    
    
    
    group.items = @[item, item1, item2, item3,item4,item5,item6];
    
    [self.groups addObject:group];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //创建cell
    JGSettingCell *cell = [JGSettingCell cellWithTableView:tableView style:UITableViewCellStyleSubtitle];
    //获取模型
    JGGroupItem *group = self.groups[indexPath.section];
    JGSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
