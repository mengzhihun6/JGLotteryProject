//
//  JGHtml.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/14.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGHtml.h"

@implementation JGHtml


//当获取字典的key和系统有冲突时使用以下方法替代

+ (void)load {
    
    //此处可使用 JGHtml或 NSObject
    [NSObject mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        
        return @{@"ID" : @"id"};
    }];
}


@end
