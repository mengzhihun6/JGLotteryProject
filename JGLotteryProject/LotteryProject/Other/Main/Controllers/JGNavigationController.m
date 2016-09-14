//
//  JGNavigationController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGNavigationController.h"

@interface JGNavigationController ()<UINavigationControllerDelegate>

@property (nonatomic, strong) id popDelegate;

@end

@implementation JGNavigationController

// 什么调用:第一个次使用这个类或者它的子类的时候
// 不一定只会调用一次
+ (void)initialize {
    
    if (self == [JGNavigationController class]) {
        
        //获取当前类的导航条 只影响当前类下面的导航条
        UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
        
        //设置导航条背景图片
        [navBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
        //设置导航条文字标题
        navBar.titleTextAttributes = @{
                                       NSForegroundColorAttributeName : [UIColor whiteColor],
                                       NSFontAttributeName : [UIFont systemFontOfSize:17] };
        
        
        
    }
}

// 类加载的时候调用
// 这个才是只会调用一次
+ (void)load {
    //只想设置一次导航条的背景图片和导航条的标题
}




- (void)viewDidLoad {
    [super viewDidLoad];

    //1. 恢复滑动返回功能：清空滑动手动代理
    _popDelegate = self.interactivePopGestureRecognizer.delegate;
    //2. 想回到导航控制器的跟控制器的时候，恢复滑动手势代理 ，目的：解决假死状态
    self.delegate = self;
    

}

//// 导航控制器显示一个控制器完成的时候就会调用
- (void)navigationController:(nonnull UINavigationController *)navigationController didShowViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController == self.childViewControllers[0]) {
        // 回到根控制器
        self.interactivePopGestureRecognizer.delegate = _popDelegate;
    }else{ // 不是根控制器
        self.interactivePopGestureRecognizer.delegate = nil;
        
    }
}



#pragma mark - 给push方法扩充功能
// 想在push的时候,设置下一个栈顶控制器的导航条的左边按钮
- (void)pushViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated
{
    // viewController:下一个栈顶控制器
    [super pushViewController:viewController animated:animated];
    
    // 不是导航控制器的根控制器才需要设置返回按钮
    if (self.childViewControllers.count > 1) { // 不是根控制器
        // 在iOS7之后,导航控制器自动添加了滑动返回功能,手指往右边滑动,就能回到上一个控制器
        // 注意:如果覆盖系统的返回按钮,滑动返回功能就失效.
        
        // 恢复滑动返回功能
        
        // 设置导航条的左边按钮
        // 设置左边按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageName:@"NavBack"] style:0 target:self action:@selector(back)];
    }
}


- (void)back {
    
    //返回
    [self popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
