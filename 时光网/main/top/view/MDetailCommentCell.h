//
//  MDetailCommentCell.h
//  时光网
//
//  Created by 汇文 on 15/11/7.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CommentsInfo;

@interface MDetailCommentCell : UITableViewCell

@property (nonatomic,strong) CommentsInfo *info;
//@property (nonatomic,assign) CGFloat rowHeight;

- (void)rowHeight;

@end
