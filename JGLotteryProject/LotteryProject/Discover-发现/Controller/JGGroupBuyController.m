//
//  JGGroupBuyController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGGroupBuyController.h"
#import "JGTitleButton.h"


@interface JGGroupBuyController ()

@property (nonatomic, weak) JGTitleButton *titleButton;

@end

@implementation JGGroupBuyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBar];

}

- (void)setUpNavBar {
    
    //默认按钮的图片在左边
    JGTitleButton *titleButton = [JGTitleButton buttonWithType:UIButtonTypeCustom];
    _titleButton = titleButton;
    
    //文字
    [titleButton setTitle:@"全部彩种" forState:UIControlStateNormal];
    
    //image
    [titleButton setImage:[UIImage imageNamed:@"YellowDownArrow"] forState:UIControlStateNormal];
    
    //设置导航条
    self.navigationItem.titleView = titleButton;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"右边" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    
    
    
}

- (void)click {
    
    [_titleButton setTitle:@"全部彩种全部彩种" forState:UIControlStateNormal];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
