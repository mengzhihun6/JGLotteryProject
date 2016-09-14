//
//  JGGuideTool.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGGuideTool.h"
#import "JGSaveTool.h"

#define JGVersion @"version"

#import "JGTabbarController.h"
#import "JGNewFeatureController.h"


@implementation JGGuideTool

+ (void)chooseRootViewController:(UIWindow *)window {
    
    //获取当前版本号与上一次记录的版本比较
    NSString *curVersion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *lastVersion = [JGSaveTool objectForKey:JGVersion];
    
    if ([curVersion isEqualToString:lastVersion]) {
       
        //没有新版本 设置窗口跟控制器
        JGTabbarController *tabbarVC = [[JGTabbarController alloc] init];
        window.rootViewController = tabbarVC;
        [window makeKeyAndVisible];
    }else { //有新版本
    
        //进入新特性界面
        JGNewFeatureController *newFeatureVC = [[JGNewFeatureController alloc] init];
        window.rootViewController = newFeatureVC;
        [JGSaveTool setObject:curVersion forKey:JGVersion];
        [window makeKeyAndVisible];
    } 
}


@end
