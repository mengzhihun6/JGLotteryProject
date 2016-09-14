//
//  JGLuckyController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGLuckyController.h"

@interface JGLuckyController ()

@property (weak, nonatomic) IBOutlet UIImageView *lightView;


@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btns;


@end

@implementation JGLuckyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"lucky_entry_light0"];
    UIImage *image1 = [UIImage imageNamed:@"lucky_entry_light1"];
    _lightView.animationImages = @[image,image1];
    _lightView.animationDuration = 0.5;
    [_lightView startAnimating];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
