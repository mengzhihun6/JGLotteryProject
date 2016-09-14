//
//  JGTabBar.h
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGTabBar;

@protocol JGTabBarDelegate <NSObject>

@optional
- (void)tabBar:(JGTabBar *)tabBar didClickBtn:(NSInteger)buttonIndex;

@end


@interface JGTabBar : UIView

// items:UITabBarItem
@property (nonatomic, strong) NSArray *items;

@property (nonatomic, weak) id<JGTabBarDelegate> delegate;

@end
