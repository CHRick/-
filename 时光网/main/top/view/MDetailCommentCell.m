//
//  MDetailCommentCell.m
//  时光网
//
//  Created by 汇文 on 15/11/7.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MDetailCommentCell.h"
#import "CommentsInfo.h"

@interface MDetailCommentCell()


@property (weak, nonatomic) IBOutlet UILabel *nikeNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

@end


@implementation MDetailCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 设置评论单元格内容
- (void)setInfo:(CommentsInfo *)info
{
    if (_info != info) {
        _info = info;
        [self.iconImage sd_setImageWithURL:[NSURL URLWithString:_info.userImage]];
        self.commentLabel.text = _info.content;
        self.commentLabel.numberOfLines = 0;
        self.nikeNameLabel.text = _info.nickname;
        self.ratingLabel.text = [NSString stringWithFormat:@"%.1f",[_info.rating floatValue]];
    }
}


@end
