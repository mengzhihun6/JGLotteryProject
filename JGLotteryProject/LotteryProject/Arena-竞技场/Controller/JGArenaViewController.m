//
//  JGArenaViewController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGArenaViewController.h"

@interface JGArenaViewController ()

@end

@implementation JGArenaViewController

//自定义控制器的View
- (void)loadView {
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    imageView.userInteractionEnabled = YES;
    self.view = imageView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpNavBar];
}

- (void)setUpNavBar {
   
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    segment.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segment;
    
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segment setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"] forState:UIControlStateSelected barMetrics:UIBarMetricsDefault];
    
    segment.tintColor = JGRGBColor(18, 142, 143);
    
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName : JGRGBColor(18, 143, 142)} forState:UIControlStateNormal];
    [segment setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]} forState:UIControlStateSelected];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
