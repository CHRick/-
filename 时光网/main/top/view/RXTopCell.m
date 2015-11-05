//
//  RXTopCell.m
//  时光网
//
//  Created by 汇文 on 15/11/4.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "RXTopCell.h"
#import "StarView.h"
#import "UIImageView+WebCache.h"
#import "TopModel.h"

#define kCellW self.frame.size.width
#define kCellH self.frame.size.height

@implementation RXTopCell

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, kCellW - 10, kCellH - 25)];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (UILabel *)titleLabel
{
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.imageView.frame) - 21 , CGRectGetWidth(self.imageView.frame), 20)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        [self.imageView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)ratingLabel
{
    if (_ratingLabel == nil) {
        _ratingLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.stars.frame) + 10, CGRectGetMinY(self.stars.frame), 20, 12)];
        _ratingLabel.textColor = [UIColor whiteColor];
        _ratingLabel.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:_ratingLabel];
    }
    return _ratingLabel;
}

- (StarView *)stars
{
    if (_stars == nil) {
        _stars = [[StarView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(self.imageView.frame) + 5, 0 , 12)];
        [self.contentView addSubview:_stars];
    }
    return _stars;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self titleLabel];
        [self ratingLabel];
    }
    return self;
}

- (void)setTopInfo:(TopModel *)info
{
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:info.images[@"medium"]]];
    self.titleLabel.text = info.title;
    self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",[info.rating[@"average"] floatValue]];
    self.stars.rating = [info.rating[@"average"] floatValue] / 10.0;
}

@end
