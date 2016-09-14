//
//  JGNewFeatureCell.h
//  LotteryProject
//
//  Created by stkcctv on 16/9/13.
//  Copyright © 2016年 stkcctv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGNewFeatureCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

- (void)setIndexPath:(NSIndexPath *)indexPath count:(int)count;

@end
