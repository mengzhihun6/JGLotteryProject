//
//  JGSaveTool.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGSaveTool.h"

@implementation JGSaveTool

+ (id)objectForKey:(NSString *)defaultName {
    
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
    
}

+ (void)setObject:(id)value forKey:(NSString *)defaultName {
    
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    
}


@end
