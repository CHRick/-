//
//  RXBarItem.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "RXBarItem.h"

@implementation RXBarItem

- (instancetype)initWithFrame:(CGRect)frame withImageName:(NSString *)name withTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if(self)
    {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 20) * 0.5, 5, 20, 20)];
        imageView.image = [UIImage imageNamed:name];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(imageView.frame), frame.size.width, 20)];
        label.text = title;
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:11];
        label.textColor = [UIColor whiteColor];
        [self addSubview:label];
    }
    return self;
}

@end
