//
//  CinemaListCell.m
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/10.
//  Copyright © 2015年 Rick. All rights reserved.
//

#import "CinemaListCell.h"

@implementation CinemaListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setInfo:(CinemaModel *)info
{
    if (_info != info) {
        _info = info;
        self.cinema.text = _info.name;
        self.location.text = _info.address;
        self.rating.text = [NSString stringWithFormat:@"%.1f",[_info.grade floatValue]];
        self.price.text = [NSString stringWithFormat:@"¥%.1f",[_info.lowPrice floatValue]];
        self.distance.text = [NSString stringWithFormat:@"%.0fKm",[self distanceCaculation:_info.coord]];
        self.isSeatSupport.hidden = ![_info.isSeatSupport boolValue];
        self.isCouponSupport.hidden = ![_info.isCouponSupport boolValue];
    }
}

- (float)distanceCaculation:(NSString *)coordinate
{
    NSUInteger index = [coordinate rangeOfString:@","].location;
    NSString *longitudeString = [coordinate substringToIndex:index];
    NSString *latitudeSting = [coordinate substringFromIndex:index + 1];
    
    return  sqrtf(powf(([longitudeString floatValue] - 115.0), 2.0) + powf(([latitudeSting floatValue] - 36.0), 2.0));
}

@end