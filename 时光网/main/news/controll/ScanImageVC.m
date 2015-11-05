//
//  ScanImageVC.m
//  时光网
//
//  Created by 汇文 on 15/11/5.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "ScanImageVC.h"
#import "NImageModel.h"

@interface ScanImageVC ()<UIScrollViewDelegate>

@property (nonatomic,copy) NSArray *imageArray;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,copy) NSArray *scrollViewArray;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *doubleTap;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *singleTap;


@end

@implementation ScanImageVC

#pragma mark - 懒加载

- (UIScrollView *)scrollView
{
    if (_scrollView == nil) {
        _scrollView = [[UIScrollView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _scrollView.contentSize = CGSizeMake(self.imageArray.count * kScreenW, kScreenH);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.contentOffset = CGPointMake(self.index * kScreenW, 0);
        [self.view addSubview:_scrollView];
    }
    return _scrollView;
}

-(NSArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [NImageModel NImageModel];
    }
    return _imageArray;
}

- (NSArray *)scrollViewArray
{
    if (_scrollViewArray == nil) {
        NSMutableArray *arrayM = [[NSMutableArray alloc]init];
        for (int i = 0; i < self.imageArray.count; i++) {
            UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(i *self.view.bounds.size.width, 0, kScreenW, kScreenH)];
            scrollView.contentSize = CGSizeMake(kScreenW, kScreenH);
            scrollView.delegate = self;
            scrollView.minimumZoomScale = 1;
            scrollView.maximumZoomScale = 5;
            [arrayM addObject:scrollView];
        }
        _scrollViewArray = arrayM;
    }
    return _scrollViewArray;
}

#pragma mark - 创建图片视图

- (void)createImage
{
    CGFloat viewHeight = kScreenW * 0.6;
    for (int i = 0; i < self.imageArray.count; i++) {
        NImageModel *info = self.imageArray[i];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, (kScreenH - viewHeight) * 0.5, kScreenW, viewHeight)];
        [imageView sd_setImageWithURL:[NSURL URLWithString:info.image]];
        imageView.tag = 100;
        [self.scrollViewArray[i] addSubview:imageView];
        [self.scrollView addSubview:self.scrollViewArray[i]];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createImage];
    //添加点击事件
    [self.doubleTap addTarget:self action:@selector(zoomImage)];
    [self.singleTap addTarget:self action:@selector(close)];
    self.singleTap.numberOfTouchesRequired = 2;
    UIView *top = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 64)];
    top.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    backButton.frame = CGRectMake(0, 20, 70, 44);
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [top addSubview:backButton];
    [self.view addSubview:top];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)zoomImage
{
    UIScrollView *view = self.scrollViewArray[self.index];
    [UIView animateWithDuration:0.3 animations:^{
        view.zoomScale = view.zoomScale == 1 ? 5 : 1;
    }];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView viewWithTag:100];
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.index = scrollView.contentOffset.x / kScreenW ;
    if ([scrollView isEqual:self.scrollView]) {
        for (UIScrollView *view in self.scrollView.subviews) {
            view.zoomScale = view.zoomScale == 1 ? 1.0 : 1.0;
        }
    }
}

@end
