//
//  JGNewFeatureController.m
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import "JGNewFeatureController.h"
#import "JGNewFeatureCell.h"


#define JGGuidePageCount 4


@interface JGNewFeatureController ()

@property (nonatomic, weak) UIImageView *guideView;
@property (nonatomic, weak) UIImageView *smallText;
@property (nonatomic, weak) UIImageView *largeText;

@property (nonatomic, assign) CGFloat offsetX;

@end

@implementation JGNewFeatureController

static NSString * const JGNewFeatureCellID = @"JGNewFeatureCellID";

- (instancetype)init {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = [UIScreen mainScreen].bounds.size;
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    return [self initWithCollectionViewLayout:layout];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    
    [self.collectionView registerClass:[JGNewFeatureCell class] forCellWithReuseIdentifier:JGNewFeatureCellID];
    
    //添加guide
    [self setUpGuide];
    
    // 添加线
    [self setUpGuideLine];
    
    // LargeText
    [self setUpGuideLargeText];
    
    // SmallText
    [self setUpGuideSmallText];

}

#pragma mark <UICollectionViewDataSource>
//添加guide
- (void)setUpGuide {
    
    UIImageView *guideV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    guideV.centerX = self.view.centerX;
    _guideView = guideV;
    [self.collectionView addSubview:guideV];
    
    
}

// 添加线
- (void)setUpGuideLine {
  
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.frame = CGRectMake(0, 0, kDeviceWidth * 4, kDeviceHight * 0.77);
    guideLine.x -= self.view.width * 0.43;
    [self.collectionView addSubview:guideLine];
}


// LargeText
- (void)setUpGuideLargeText {
    
    UIImageView *largeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    _largeText = largeText;
    largeText.y = self.view.height * 0.7;
    largeText.centerX = self.view.centerX;
    [self.collectionView addSubview:largeText];
    
    
}

// SmallText
- (void)setUpGuideSmallText {
    
    UIImageView *smallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    _smallText = smallText;
    smallText.y = self.view.height * 0.8;
    smallText.centerX = self.view.centerX;
    [self.collectionView addSubview:smallText];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //获取当前偏移量
    CGFloat offsetX = scrollView.contentOffset.x;
    
    //获取偏移量差
    CGFloat offsetGap = offsetX - _offsetX;
    
    //guideView
    _guideView.x += 2 * offsetGap;
    //largeText
    _largeText.x += 2 * offsetGap;
    //smallText
    _smallText.x += 2 * offsetGap;
    
    [UIView animateWithDuration:0.25 animations:^{
        
        _guideView.x -= offsetGap;
        _largeText.x -= offsetGap;
        _smallText.x -= offsetGap;
        
    }];
    
    // 切换图片
    int page = offsetX / self.view.width + 1;
    
    _guideView.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%d",page]];
    
    _largeText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%d",page]];
    
    _smallText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%d",page]];
    
    _offsetX = offsetX;
}





#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return JGGuidePageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JGNewFeatureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:JGNewFeatureCellID forIndexPath:indexPath];
    
    cell.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%ldBackground568h",indexPath.row + 1]];
    [cell setIndexPath:indexPath count:JGGuidePageCount];
    
    return cell;
}


@end
