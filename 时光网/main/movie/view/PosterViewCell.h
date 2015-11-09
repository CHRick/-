//
//  PosterViewCell.h
//  时光网
//
//  Created by 汇文 on 15/11/7.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoveInfo;

@interface PosterViewCell : UICollectionViewCell

@property (nonatomic,strong) MoveInfo *info;



- (void)flip;

@end
