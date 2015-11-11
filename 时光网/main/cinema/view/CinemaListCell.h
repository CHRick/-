//
//  CinemaListCell.h
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/10.
//  Copyright © 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *cinema;
@property (weak, nonatomic) IBOutlet UILabel *location;
@property (weak, nonatomic) IBOutlet UILabel *isSeatSupport;
@property (weak, nonatomic) IBOutlet UILabel *isCouponSupport;
@property (weak, nonatomic) IBOutlet UILabel *rating;
@property (weak, nonatomic) IBOutlet UILabel *price;
@property (weak, nonatomic) IBOutlet UILabel *distance;

@property (nonatomic,strong) CinemaModel *info;

@end
