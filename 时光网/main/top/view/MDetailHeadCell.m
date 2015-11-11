//
//  MDetailHeadCell.m
//  时光网
//
//  Created by 汇文 on 15/11/6.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MDetailHeadCell.h"


@implementation MDetailHeadCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 设置第一个单元格的内容
- (void)setInfo:(NSDictionary *)info
{
    if (_info != info) {
        _info = info;
        [self.poster sd_setImageWithURL:[NSURL URLWithString:_info[@"image"]]];
        self.poster.backgroundColor = [UIColor redColor];
        self.titleLabel.text = _info[@"titleCn"];
        self.subTitleLabel.text = _info[@"titleEn"];
        self.detailText.text = _info[@"content"];
        self.detailText.font = [UIFont systemFontOfSize:20];
        self.detailText.textColor = [UIColor whiteColor];
    }
}
@end
