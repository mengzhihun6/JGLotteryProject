//
//  JGSettingItem.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGSettingItem.h"

@implementation JGSettingItem

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title {
    
    JGSettingItem *item = [[self alloc] init];
    
    item.image = image;
    item.title = title;
    
    return item;
}

@end
