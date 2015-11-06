//
//  ScanImageCell.m
//  时光网
//
//  Created by 汇文 on 15/11/6.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "ScanImageCell.h"
#import "NImageModel.h"

@interface ScanImageCell()<UIScrollViewDelegate>

@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) UIImageView *imageView;


@end

@implementation ScanImageCell

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        _scrollView.contentSize = CGSizeMake(kScreenW, kScreenH);
        _scrollView.minimumZoomScale = 1;
        _scrollView.maximumZoomScale = 5;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        [self.contentView addSubview:_scrollView];
        
        UITapGestureRecognizer *doubelTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(zoomImage:)];
        doubelTap.numberOfTapsRequired = 2;
        [_scrollView addGestureRecognizer:doubelTap];
        
        //添加点击事件
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(sendNote)];
        [_scrollView addGestureRecognizer:singleTap];
        
        [singleTap requireGestureRecognizerToFail:doubelTap];
        
    }
    return _scrollView;
}

- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.scrollView addSubview:_imageView];
    }
    return _imageView;
}

- (void)setImage:(NImageModel *)image
{
    if (_image != image) {
        _image = image;
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:_image.image]];
    }
}

- (void)sendNote
{
    [[NSNotificationCenter defaultCenter] postNotificationName:KTapNotification object:nil];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView.subviews lastObject];
}

- (void)zoomImage:(UITapGestureRecognizer *)tap
{
    UIScrollView *view = self.scrollView;
    [UIView animateWithDuration:0.3 animations:^{
        view.zoomScale = view.zoomScale == 1 ? 5 : 1;
    }];
}


@end
