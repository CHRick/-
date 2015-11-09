//
//  IndexCell.h
//  时光网
//
//  Created by 汇文 on 15/11/9.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MoveInfo;

@interface IndexCell : UICollectionViewCell

@property (nonatomic,strong) MoveInfo *info;
@property (nonatomic,strong) UIImageView *imageView;

@end
