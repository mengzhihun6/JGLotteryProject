//
//  JGPopMenu.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGPopMenu.h"

@implementation JGPopMenu

- (void)hideInPoint:(CGPoint)point completion:(void (^)())completion {
    
    //pop菜单（平移+缩放）
    [UIView animateWithDuration:1.0f animations:^{
        
        self.center = point;
        //形变
        self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    } completion:^(BOOL finished) {
       
        //移除
        [self removeFromSuperview];
        completion();
    }];
    
    
}

+ (instancetype)showInPoint:(CGPoint)point {
   
    JGPopMenu *menu = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
    menu.center = point;
    
    //获取主窗口
    [[UIApplication sharedApplication].keyWindow addSubview:menu];
    
    return menu;
}



- (IBAction)close:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(popMenuDidClickClose:)]) {
        [_delegate popMenuDidClickClose:self];
    }
    
}

@end
