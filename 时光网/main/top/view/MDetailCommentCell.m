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

@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *nikeNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end


@implementation MDetailCommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfo:(CommentsInfo *)info
{
    if (_info != info) {
        _info = info;
        [self.iconImage sd_setImageWithURL:[NSURL URLWithString:_info.userImage]];
        self.commentLabel.text = _info.content;
        self.commentLabel.numberOfLines = 0;
        self.nikeNameLabel.text = _info.nickname;
    }
}

- (void)rowHeight
{
    if (self.selected) {
        NSString *text = self.commentLabel.text;
        CGRect frame = [text boundingRectWithSize:CGSizeMake(247, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}context:nil];
//        self.rowHeight = frame.size.height + 60;
    }
}


@end
