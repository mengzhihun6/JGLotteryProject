//
//  JGArenaNavigationController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGArenaNavigationController.h"

@interface JGArenaNavigationController ()

@end

@implementation JGArenaNavigationController

+ (void)load {
    
    //获取当前类下的所有导航条
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
    [navBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
