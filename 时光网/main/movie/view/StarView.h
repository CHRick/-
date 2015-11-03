//
//  StarView.h
//  时光网
//
//  Created by 汇文 on 15/11/2.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StarView : UIView

- (instancetype)initWithFrame:(CGRect)frame withStars:(float)stars;

- (void)stars:(float)rating;

@end
