//
//  IndexCell.m
//  时光网
//
//  Created by 汇文 on 15/11/9.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "IndexCell.h"
#import "MoveInfo.h"

@implementation IndexCell

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:self.contentView.bounds];
        _imageView.hidden = NO;
        _imageView.transform = CGAffineTransformMakeScale(0.8, 0.8);
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


@end
