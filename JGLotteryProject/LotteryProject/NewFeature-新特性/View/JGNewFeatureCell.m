//
//  JGNewFeatureCell.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGNewFeatureCell.h"

#import "JGTabbarController.h"

@interface JGNewFeatureCell ()

@property (nonatomic, weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *startButton;

@end



@implementation JGNewFeatureCell

- (UIButton *)startButton {
    
    if (!_startButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [btn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [btn sizeToFit];
        
        btn.center = CGPointMake(self.width * 0.5, self.height * 0.9);
        
        [btn addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
        
        _startButton = btn;
        [self addSubview:btn];
    }
    return _startButton;
}

- (UIImageView *)imageView {
    
    if (!_imageView) {
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:imageV];
        _imageView = imageV;
        
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
    
    
}

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count {
    
    self.startButton.hidden = (indexPath.row == count - 1) ? NO : YES;
}

- (void)start {
    
    JGTabbarController *tabbarVC = [[JGTabbarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabbarVC;
    
}



@end
