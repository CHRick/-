//
//  MovieDetailView.m
//  时光网
//
//  Created by 汇文 on 15/11/9.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MovieDetailView.h"

@interface MovieDetailView()

@end

@implementation MovieDetailView

- (void)setInfo:(MoveInfo *)info
{
    if (_info != info) {
        _info = info;
        self.ENTitle.text = _info.original_title;
        self.CNTitle.text = _info.title;
        [self.poster sd_setImageWithURL:[NSURL URLWithString:_info.images[@"large"]]];
        self.star.rating = [_info.rating[@"average"] floatValue] / 10.0;
        self.rating.text = [NSString stringWithFormat:@"%.1f",[_info.rating[@"average"] floatValue]];
    }
}

@end
