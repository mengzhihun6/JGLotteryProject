//
//  JGPopMenu.h
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGPopMenu;

@protocol JGPopMenuDelegate <NSObject>

@optional
- (void)popMenuDidClickClose:(JGPopMenu *)popMenu;
@end


@interface JGPopMenu : UIView

/** 代理 */
@property (nonatomic, weak) id<JGPopMenuDelegate> delegate;

+ (instancetype)showInPoint:(CGPoint)point;

//completion:隐藏完成的时候需要做的事情
- (void)hideInPoint:(CGPoint)point completion:(void (^)())completion;


@end
