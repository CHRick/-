//
//  NewsCell.m
//  时光网
//
//  Created by 汇文 on 15/11/3.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
#import "UIImageView+WebCache.h"

@implementation NewsCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)cellSetInfo:(NewsModel *)news
{
    [self.posterImage sd_setImageWithURL:[NSURL URLWithString:news.image]];
    self.titleLabel.text = news.title;
    self.summryLabel.text = news.summary;
    CGRect frame = self.summryLabel.frame;
    
    NSInteger type = [news.type integerValue];
    if (type == 0) {
        self.iconImage.hidden = YES;
        frame.origin.x = CGRectGetMaxX(self.posterImage.frame) + 10;
    }else if(type == 1){
        self.iconImage.hidden = NO;
        self.iconImage.image = [UIImage imageNamed:@"sctpxw"];
        frame.origin.x = CGRectGetMaxX(self.iconImage.frame) + 3;
    }else{
        self.iconImage.hidden = NO;
        self.iconImage.image = [UIImage imageNamed:@"scspxw"];
        frame.origin.x = CGRectGetMaxX(self.iconImage.frame) + 3;
    }
    self.summryLabel.frame = frame;

}

@end
