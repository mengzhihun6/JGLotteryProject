//
//  JGSettingCell.h
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGSettingItem;

@interface JGSettingCell : UITableViewCell

@property (nonatomic, strong) JGSettingItem *item;

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style;

@end
