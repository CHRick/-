 //
//  MDetailHeadCell.h
//  时光网
//
//  Created by 汇文 on 15/11/6.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDetailHeadCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextView *detailText;
@property (nonatomic,copy) NSDictionary *info;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *poster;


@end
