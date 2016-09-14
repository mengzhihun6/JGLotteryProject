//
//  JGSettingCell.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGSettingCell.h"
#import "JGSettingArrowItem.h"
#import "JGSettingSwitchItem.h"

@interface JGSettingCell ()

@property (nonatomic, weak) UIImageView *arrowView;
@property (nonatomic, strong) UISwitch *switchView;

@end


@implementation JGSettingCell

- (UIImageView *)arrowView
{
    if (_arrowView == nil) {
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CellArrow"]];
        [self.contentView addSubview:img];
        _arrowView = img;
    }
    return _arrowView;
}

- (UISwitch *)switchView {
    
    if (!_switchView) {
        _switchView = [[UISwitch alloc] init];
    }
    
    return _switchView;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView style:(UITableViewCellStyle)style {
    
    static NSString *ID = @"setCell";
    JGSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[self alloc] initWithStyle:style reuseIdentifier:ID];
    }
    
    [cell setUp];
    
    return cell;
}

//cell的背景设置
- (void)setUp {
  
    self.backgroundColor = [UIColor clearColor];
    
    //背景
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GroupCell"]];
    self.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GroupCellSelected"]];
}


- (void)setItem:(JGSettingItem *)item {
    
    _item = item;
    
    [self setUpData];
    
    // 设置辅助视图
    [self setUpAccessory];
}

- (void)setUpData {
    
   
    //isKindOfClass 可以判断是否属于该类及其子类
    //isMemberOfClass 只可以判断是否属于该类（不包含该子类）
    if ([_item isKindOfClass:[JGSettingItem class]]) {
        
//         JGLog(@"%@",[_item class]);
        
        self.textLabel.text = _item.title;
        self.imageView.image = _item.image;
        self.detailTextLabel.text = _item.subTitle;
        
//        JGLog(@"subTitle: %@",_item.subTitle);
    }else {
        self.textLabel.text = _item.title;
    }
    
    
    
}


- (void)setUpAccessory {
    
    if ([_item isKindOfClass:[JGSettingArrowItem class]]) {
        
        //显示箭头
//        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.accessoryView = self.arrowView;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
    }else if ([_item isKindOfClass:[JGSettingSwitchItem class]]) {
        //显示开关
        self.accessoryView = self.switchView;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }else {
      
        self.accessoryView = nil;
//        self.accessoryType = UITableViewCellAccessoryNone;
        self.selectionStyle = UITableViewCellSelectionStyleDefault;
        
    }
    
    
}



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



@end
