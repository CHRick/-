//
//  MovieDetailView.h
//  时光网
//
//  Created by 汇文 on 15/11/9.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StarView.h"
#import "MoveInfo.h"

@interface MovieDetailView : UIView
@property (weak, nonatomic) IBOutlet UILabel *CNTitle;
@property (weak, nonatomic) IBOutlet UILabel *ENTitle;
@property (weak, nonatomic) IBOutlet UIImageView *poster;
@property (weak, nonatomic) IBOutlet StarView *star;
@property (weak, nonatomic) IBOutlet UILabel *rating;

@property (nonatomic,strong) MoveInfo *info;

@end
