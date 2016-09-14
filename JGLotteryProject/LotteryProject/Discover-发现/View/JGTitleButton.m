//
//  JGTitleButton.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGTitleButton.h"

@implementation JGTitleButton

//自己的frame一改变，就会调用
- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    //修改按钮内部子控件位置
    if (self.titleLabel.x > self.imageView.x) {
        
        //设置label
        self.titleLabel.x = self.imageView.x;
        //设置ImageView
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }
}

//重写目的，不需要覆盖之前的做法
//扩充这个方法的功能
- (void)setTitle:(NSString *)title forState:(UIControlState)state {
    [super setTitle:title forState:state];
    
    //自动计算尺寸功能 重新计算按钮的尺寸
    [self sizeToFit];
}

-
(void)setImage:(UIImage *)image forState:(UIControlState)state {
    [super setImage:image forState:state];
    [self sizeToFit];
}


@end
