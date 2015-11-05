//
//  RXTopCell.h
//  时光网
//
//  Created by 汇文 on 15/11/4.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class StarView;
@class TopModel;


@interface RXTopCell : UICollectionViewCell

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *ratingLabel;
@property (nonatomic,strong) StarView *stars;

- (void)setTopInfo:(TopModel *)info;

@end
