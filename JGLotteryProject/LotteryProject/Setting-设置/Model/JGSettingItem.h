//
//  JGSettingItem.h
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGSettingItem : NSObject

/** 图片  */
@property (nonatomic, strong)UIImage *image;
/** 标题  */
@property (nonatomic, strong)NSString *title;
/** 子标题 */
@property (nonatomic, strong) NSString *subTitle;

@property (nonatomic, strong) void(^optionBlock)(NSIndexPath *indexPath);

+ (instancetype)itemWithImage:(UIImage *)image title:(NSString *)title;
@end
