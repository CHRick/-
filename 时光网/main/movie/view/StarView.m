//
//  StarView.m
//  时光网
//
//  Created by 汇文 on 15/11/2.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "StarView.h"

@implementation StarView

/**
 *  子类化评分星星
 *
 *  @param frame 视图的大小和位置
 *  @param stars 评分
 *
 *  @return 初始化的视图
 */

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createBasicView];
    }
    return self;
}
/**
 *  从xib加载视图时调用
 */
- (void)awakeFromNib
{
    [self createBasicView];
}

/**
 *  创建基础星星视图
 */

- (void)createBasicView
{
    UIImage *grayStar = [UIImage imageNamed:@"gray"];
    UIImage *yellowStar = [UIImage imageNamed:@"yellow"];
    
    CGFloat scale = self.frame.size.height / grayStar.size.height;
    
    CGRect frame = self.frame;
    
    frame.size.width = frame.size.height * 5;
    self.frame = frame;
    
    UIView *grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayStar.size.width * 5, grayStar.size.height)];
    grayView.backgroundColor = [UIColor colorWithPatternImage:grayStar];
    grayView.transform = CGAffineTransformMakeScale(scale, scale);
    CGRect grayFrame = grayView.frame;
    grayFrame.origin = CGPointZero;
    grayView.frame = grayFrame;
    grayView.tag = 8888;
    [self addSubview:grayView];
    
    UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayStar.size.width * 5, grayStar.size.height)];
    yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowStar];
    yellowView.transform = CGAffineTransformMakeScale(scale, scale);
    CGRect yellowFrame = yellowView.frame;
    yellowFrame.origin = CGPointZero;
    yellowView.frame = yellowFrame;
    yellowView.tag = 9999;
    [self addSubview:yellowView];
}

- (void)setRating:(float)rating
{
    UIView *view = (UIView *)[self viewWithTag:8888];
    UIView *yellowView = (UIView *)[self viewWithTag:9999];
    CGRect frame = view.frame;
    frame.size.width *= rating;
    yellowView.frame = frame;
}



@end
