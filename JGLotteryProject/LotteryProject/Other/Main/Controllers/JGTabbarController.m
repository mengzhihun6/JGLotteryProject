//
//  JGTabbarController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGTabbarController.h"

#import "JGHallViewController.h"
#import "JGArenaViewController.h"
#import "JGDiscoverViewController.h"
#import "JGHistoryViewController.h"
#import "JGMyLotteryViewController.h"

#import "JGNavigationController.h"
#import "JGArenaNavigationController.h"


#import "JGTabBar.h"


@interface JGTabbarController ()<JGTabBarDelegate>

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation JGTabbarController

- (NSMutableArray *)items
{
    if (_items == nil) {
        _items = [NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加所有控制器
    [self seuUpAllChildViewController];
    
    // 自定义tabBar
    [self setUpTabBar];

}

- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
    //移除系统UITabBar上自带的按钮
    for (UIView *childView in self.tabBar.subviews) {
        
        if ([childView isKindOfClass:[JGTabBar class]] == NO) {
            [childView removeFromSuperview];
        }
    }
}


- (void)setUpTabBar {
    
    JGTabBar *tabbar = [[JGTabBar alloc] initWithFrame:self.tabBar.bounds];
    tabbar.delegate = self;
    tabbar.items = self.items;
//    tabbar.backgroundColor = [UIColor redColor];
    [self.tabBar addSubview:tabbar];
}

#pragma mark - JGTabBarDelegate -
- (void)tabBar:(JGTabBar *)tabBar didClickBtn:(NSInteger)buttonIndex {
    self.selectedIndex = buttonIndex;
}


- (void)seuUpAllChildViewController {
    
    // 1.购彩大厅
    JGHallViewController *hall = [[JGHallViewController alloc] init];
    
    // 添加tabBarVc子控制器,并且设置对应对应按钮的内容
    [self setUPOneChildViewController:hall image:[UIImage imageNamed:@"TabBar_LotteryHall_new"] selImage:[UIImage imageNamed:@"TabBar_LotteryHall_selected_new"] title:@"购彩大厅"];
    
    // 2.竞技场
    JGArenaViewController *arena = [[JGArenaViewController alloc] init];
//    arena.view.backgroundColor = [UIColor yellowColor];
    [self setUPOneChildViewController:arena image:[UIImage imageNamed:@"TabBar_Arena_new"] selImage:[UIImage imageNamed:@"TabBar_Arena_selected_new"] title:@"竞技场"];
    
    // 3.发现
    // 加载storyboard
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"JGDiscoverViewController" bundle:nil];
    JGDiscoverViewController *discover = [storyboard instantiateInitialViewController];
    [self setUPOneChildViewController:discover image:[UIImage imageNamed:@"TabBar_Discovery_new"] selImage:[UIImage imageNamed:@"TabBar_Discovery_selected_new"] title:@"发现"];
    
    // 4.开奖信息
    JGHistoryViewController *history = [[JGHistoryViewController alloc] init];
    [self setUPOneChildViewController:history image:[UIImage imageNamed:@"TabBar_History_new"] selImage:[UIImage imageNamed:@"TabBar_History_selected_new"] title:@"开奖信息"];
    
    // 5.我的彩票
    JGMyLotteryViewController *myLottery = [[JGMyLotteryViewController alloc] init];
    [self setUPOneChildViewController:myLottery image:[UIImage imageNamed:@"TabBar_MyLottery_new"] selImage:[UIImage imageNamed:@"TabBar_MyLottery_selected_new"] title:@"我的彩票"];
}

//添加一个子控制器
- (void)setUPOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title {
    
    vc.navigationItem.title = title;
    UINavigationController *nav = [[JGNavigationController alloc] initWithRootViewController:vc];
    
    if ([vc isKindOfClass:[JGArenaViewController class]]) {
        nav = [[JGArenaNavigationController alloc] initWithRootViewController:vc];
    }
    

    //设置对应tabbarButton内容，由对应的自控器
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = selImage;
    
    //保存对应的按钮模型
    [self.items addObject:nav.tabBarItem];
    
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
