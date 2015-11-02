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

- (instancetype)initWithFrame:(CGRect)frame withStars:(float)stars
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *grayStar = [UIImage imageNamed:@"gray"];
        UIImage *yellowStar = [UIImage imageNamed:@"yellow"];
        
        CGFloat scale = frame.size.height / grayStar.size.height;
        
        frame.size.width = frame.size.height * 5;
        self.frame = frame;
        
        UIView *grayView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayStar.size.width * 5, grayStar.size.height)];
        grayView.backgroundColor = [UIColor colorWithPatternImage:grayStar];
        grayView.transform = CGAffineTransformMakeScale(scale, scale);
        CGRect grayFrame = grayView.frame;
        grayFrame.origin = CGPointZero;
        grayView.frame = grayFrame;
        [self addSubview:grayView];
        
        UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, grayStar.size.width * stars, grayStar.size.height)];
        yellowView.backgroundColor = [UIColor colorWithPatternImage:yellowStar];
        yellowView.transform = CGAffineTransformMakeScale(scale, scale);
        CGRect yellowFrame = yellowView.frame;
        yellowFrame.origin = CGPointZero;
        yellowView.frame = yellowFrame;
        [self addSubview:yellowView];
        
    }
    return self;
}

@end
