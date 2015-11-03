//
//  NewsCell.h
//  时光网
//
//  Created by 汇文 on 15/11/3.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NewsModel;

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *posterImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *summryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


- (void)cellSetInfo:(NewsModel *)news;

@end
