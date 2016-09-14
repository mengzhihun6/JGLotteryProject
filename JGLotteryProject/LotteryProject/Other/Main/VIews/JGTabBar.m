//
//  JGTabBar.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGTabBar.h"
#import "JGTabBarButton.h"

@interface JGTabBar ()

@property (nonatomic, weak) UIButton *selButton;

@end


@implementation JGTabBar

- (void)setItems:(NSArray *)items {
    _items = items;
    
    int i = 0;
    
    for (UITabBarItem *item in items) {
        
        //创建按钮
        JGTabBarButton *btn = [JGTabBarButton buttonWithType:UIButtonTypeCustom];
        btn.tag = i;
        
        [btn setBackgroundImage:item.image forState:UIControlStateNormal];
        [btn setBackgroundImage:item.selectedImage forState:UIControlStateSelected];
        
        //监听按钮
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        i++;
        if (btn.tag == 0) { //第0个按钮
            [self btnClick:btn];
        }
        
        [self addSubview:btn];
    }
}


- (void)btnClick:(UIButton *)btn {
    
    
    _selButton.selected = NO;
    btn.selected = YES;
    _selButton = btn;
    
    //切换界面
    //通知tabbarVC切换界面
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_delegate tabBar:self didClickBtn:btn.tag];
    }
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    int count = (int)_items.count;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = self.width / count;
    CGFloat h = self.height;
    
    //设置按钮的位置
    for (int i = 0; i < count; i++) {
        UIButton *btn = self.subviews[i];
        x = w * i;
        btn.frame = CGRectMake(x, y, w, h);
    }
}



@end
