//
//  JGBaseSettingController.h
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "JGGroupItem.h"
#import "JGSettingItem.h"
#import "JGSettingArrowItem.h"
#import "JGSettingSwitchItem.h"

@interface JGBaseSettingController : UITableViewController

// 保存当前tableView有多少组,元素应该是一个groupItem
@property (nonatomic, strong) NSMutableArray *groups;

@end
