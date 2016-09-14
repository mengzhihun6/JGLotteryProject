//
//  UIImage+JGImage.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "UIImage+JGImage.h"

@implementation UIImage (JGImage)

// 给定一个最原始的图片名称生成一个原始的图片
+ (instancetype)imageWithOriginalImageName:(NSString *)imageName {
    
    UIImage *image = [UIImage imageNamed:imageName];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}


@end
