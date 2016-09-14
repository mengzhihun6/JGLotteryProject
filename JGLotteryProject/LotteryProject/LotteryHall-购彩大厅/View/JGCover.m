//
//  JGCover.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGCover.h"

@implementation JGCover

//显示
+ (void)show {
   
    JGCover *cover = [[JGCover alloc] initWithFrame:[UIScreen mainScreen].bounds];
    cover.backgroundColor = [UIColor blackColor];
    cover.alpha = 0.3;
    
    [[UIApplication sharedApplication].keyWindow addSubview:cover];
    
}
//隐藏
+ (void)hide {
   
    //移除蒙版
    for (UIView *childView in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([childView isKindOfClass:self]) {
            [childView removeFromSuperview];
        }
    }
    
    
}


@end
