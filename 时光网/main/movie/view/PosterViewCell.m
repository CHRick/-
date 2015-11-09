//
//  PosterViewCell.m
//  时光网
//
//  Created by 汇文 on 15/11/7.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "PosterViewCell.h"
#import "MoveInfo.h"

@interface PosterViewCell()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIView *detail;

@end

@implementation PosterViewCell

- (UIView *)detail
{
    if (_detail == nil) {
        _detail = [[UIView alloc]initWithFrame:self.imageView.bounds];
        _detail.hidden = YES;
        _detail.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_detail];
    }
    return _detail;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        _imageView.hidden = NO;
        _imageView.transform = CGAffineTransformMakeScale(0.95, 0.95);
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

- (void)setInfo:(MoveInfo *)info
{
    if (_info != info) {
        _info = info;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:_info.images[@"large"]]];
    }
}

- (void)flip
{
    self.imageView.hidden = !self.imageView.hidden;
    self.detail.hidden = !self.detail.hidden;
    
    UIViewAnimationOptions flip = self.detail.hidden ? UIViewAnimationOptionTransitionFlipFromRight : UIViewAnimationOptionTransitionFlipFromLeft;
    [UIView transitionWithView:self.contentView duration:0.5 options:flip animations:^{

    } completion:nil];
}

@end
