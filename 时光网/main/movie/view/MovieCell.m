//
//  MovieCell.m
//  时光网
//
//  Created by 汇文 on 15/11/2.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MovieCell.h"
#import "MoveInfo.h"
#import "StarView.h"
#import "UIImageView+WebCache.h"

@implementation MovieCell

/**
 *  填充自定义单元的信息
 *
 *  @param info 包含所有信息的字典
 */
- (void)setMovieInfo:(MoveInfo *)info
{
    float stars = [info.rating[@"average"] integerValue] / 10.0;
//    StarView *star = [[StarView alloc]initWithFrame:self.ratingView.bounds withStars:stars];
//    [self.ratingView addSubview:star];
    self.ratingView.rating = stars;
    
    [self.posterView sd_setImageWithURL:info.images[@"medium"]];
    
    self.titleLabel.text = info.title;
    self.yearLabel.text = [NSString stringWithFormat:@"年份：%@",info.year];
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",[info.rating[@"average"] floatValue]];
}

- (void)awakeFromNib {

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
