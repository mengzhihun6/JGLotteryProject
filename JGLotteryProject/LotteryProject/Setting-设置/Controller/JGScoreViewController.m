//
//  JGScoreViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGScoreViewController.h"

@interface JGScoreViewController ()

@end

@implementation JGScoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 第一组
    [self setUpGroup0];
    
    // 第二组
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
    [self setUpGroup2];
}


- (void)setUpGroup0 {
    
    //创建组模型
    JGGroupItem *group = [[JGGroupItem alloc] init];
     group.footTitle = @"开启后，当我投注或关注的比赛开始、进球和结束时，会自动发送推送消息提醒我";
    //创建行模型
    JGSettingSwitchItem *item = [JGSettingSwitchItem itemWithImage:nil title:@"推送我关注的比赛"];
    
    group.items = @[item];
    
    [self.groups addObject:group];
}

- (void)setUpGroup2 {
    
    //创建组模型
    JGGroupItem *group = [[JGGroupItem alloc] init];
    group.headTitle = @"只在以下时间段接收比分直播推送";
    //创建行模型
    JGSettingItem *item = [JGSettingItem itemWithImage:nil title:@"起始时间"];
    item.subTitle = @"00:00";
    group.items = @[item];
    
    item.optionBlock = ^(NSIndexPath *indexPath) {
        
        //获取点击的cell
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        
        //弹出键盘
        UITextField *textField = [[UITextField alloc] init];
        [textField becomeFirstResponder];
        [cell addSubview:textField];
        
        // 做键盘处理,只要键盘挡住cell,把cell往上移动.
        // 点击哪个cell,就把文本框添加到对应的cell上就自动完成键盘处理 
    };
    
    [self.groups addObject:group];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}



@end
