//
//  JGBaseSettingController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGBaseSettingController.h"
#import "JGSettingCell.h"


@interface JGBaseSettingController ()

@end

@implementation JGBaseSettingController

- (NSMutableArray *)groups
{
    if (_groups == nil) {
        _groups = [NSMutableArray array];
    }
    return _groups;
}

- (instancetype)init {
    return [self initWithStyle:UITableViewStyleGrouped];
}


- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - tableView数据源 -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    JGGroupItem *group = self.groups[section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //创建cell
    JGSettingCell *cell = [JGSettingCell cellWithTableView:tableView style:UITableViewCellStyleValue1];
    //获取模型
    JGGroupItem *group = self.groups[indexPath.section];
    JGSettingItem *item = group.items[indexPath.row];
    cell.item = item;
    
    return cell;
}

#pragma mark - TableViewDelegate
//返回每一组的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    JGGroupItem *group = self.groups[section];
    return group.headTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    
    JGGroupItem *group = self.groups[section];
    return group.footTitle;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    JGGroupItem *group = self.groups[indexPath.section];
    
    JGSettingArrowItem *item = group.items[indexPath.row];
    
    if (item.optionBlock) {
        item.optionBlock(indexPath);
        return;
    }
    
    if ([item isKindOfClass:[JGSettingArrowItem class]]) {
        //标示箭头类型，可以跳转
        JGSettingArrowItem *arrowItem = (JGSettingArrowItem *)item;
        
        //获取需要跳转的控制器
        if (arrowItem.descVc) {
            //创建需要跳转的控制器对象
            UIViewController *vc = [[arrowItem.descVc alloc] init];
            //跳转界面
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
