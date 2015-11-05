//
//  MovieCell.h
//  时光网
//
//  Created by 汇文 on 15/11/2.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoveInfo;
@class StarView;

@interface MovieCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet StarView *ratingView;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *ratingLabel;

- (void)setMovieInfo:(MoveInfo *)info;
@end
