//
//  JGGroupItem.h
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGGroupItem : NSObject

/** 头部标题  */
@property (nonatomic, strong)NSString *headTitle;

/** 尾部标题  */
@property (nonatomic, strong)NSString *footTitle;

//行模型数组
//描述当前组有多少行，items：cell对应的模型（JGSettingItem）
@property (nonatomic, strong)NSArray *items;

@end
