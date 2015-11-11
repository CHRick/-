//
//  PosterViewCell.m
//  时光网
//
//  Created by 汇文 on 15/11/7.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "PosterViewCell.h"
#import "MoveInfo.h"
#import "MovieDetailView.h"

@interface PosterViewCell()

@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) MovieDetailView *detail;

@end

@implementation PosterViewCell

- (MovieDetailView *)detail
{
    if (_detail == nil) {
        _detail = [[[NSBundle mainBundle]loadNibNamed:@"MovieDetailView" owner:nil options:nil]lastObject];
        _detail.hidden = YES;
        _detail.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.3];
        _detail.transform = CGAffineTransformMakeScale(0.95, 0.95);
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
        self.detail.info = _info;
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
