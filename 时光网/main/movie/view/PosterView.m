//
//  PosterView.m
//  时光网
//
//  Created by 汇文 on 15/11/7.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "PosterView.h"
#import "PosterCollectionView.h"
#import "MoveInfo.h"
#import "UIViewExt.h"
#import "IndexCollectionView.h"
#import "MoveInfo.h"

@interface PosterView()

@property (nonatomic,strong) PosterCollectionView *collectionView;
@property (nonatomic,strong) IndexCollectionView *indexCV;
@property (nonatomic,strong) UILabel *title;


@end

@implementation PosterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createHeadView];
        [self createCover];
        [self createSwipeGesture];
        [self collectionView];
        [self indexCV];
        [self createMovieTitle];
        
        [self.collectionView addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew context:nil];
        [self.indexCV addObserver:self forKeyPath:@"currentPage" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)createMovieTitle
{
    _title = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.collectionView.frame), kScreenW, 30)];
    _title.textColor = [UIColor whiteColor];
    _title.textAlignment = NSTextAlignmentCenter;
    _title.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
    [self addSubview:_title];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentPage"]) {
        if ([object isKindOfClass:[PosterCollectionView class]] && self.indexCV.currentPage != [change[@"new"] integerValue]) {
            self.indexCV.currentPage = [change[@"new"] integerValue];
        }else if([object isKindOfClass:[IndexCollectionView class]] && self.collectionView.currentPage != [change[@"new"] integerValue]){
            self.collectionView.currentPage = [change[@"new"] integerValue];
        }
     self.title.text = [self.info[self.collectionView.currentPage] title];
    }
}

- (IndexCollectionView *)indexCV
{
    if (_indexCV == nil) {
        _indexCV = [[IndexCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 100)];
        _indexCV.pageWidth = 50;
        _indexCV.backgroundColor = [UIColor clearColor];
        [self.headView addSubview:_indexCV];
    }
    return _indexCV;
}

- (PosterCollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 30, kScreenW, self.height - 130 - 30 - 15)];
        [self insertSubview:_collectionView atIndex:0];
        _collectionView.pageWidth = 220;
        _collectionView.backgroundColor = [UIColor clearColor];
    }
    return _collectionView;
}

- (void)createSwipeGesture
{
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(showHeadView)];
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
}

- (void)createCover
{
    UIControl *cover = [[UIControl alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    cover.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    [cover addTarget:self action:@selector(hideHeadView) forControlEvents:UIControlEventTouchUpInside];
    [self insertSubview:cover belowSubview:self.headView];
    cover.tag = 12345;
    cover.hidden = YES;
}

- (void)createHeadView
{
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, -100, kScreenW, 130)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 130)];
    UIImage *image = [UIImage imageNamed:@"indexBG_home"];
    imageView.image = [image stretchableImageWithLeftCapWidth:100 topCapHeight:1];;
    
    [self.headView addSubview:imageView];
    [self addSubview:self.headView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:@"down_home"] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"up_home"] forState:UIControlStateSelected];
    button.contentMode = UIViewContentModeScaleAspectFit;
    button.frame = CGRectMake((kScreenW - 20) * 0.5, 115, 20, 15);
    [self.headView addSubview:button];
    button.tag = 888;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonClick:(UIButton *)button
{
    if (button.selected) {
        [self hideHeadView];
    }else{
        [self showHeadView];
    }
}

- (void)showHeadView
{
    [(UIControl *)[self viewWithTag:12345] setHidden:NO];
    [(UIButton *)[self.headView viewWithTag:888] setSelected:YES];
    [UIView animateWithDuration:0.5 animations:^{
        self.headView.transform = CGAffineTransformMakeTranslation(0, 100);
    }];
}

- (void)hideHeadView
{
    [(UIControl *)[self viewWithTag:12345] setHidden:YES];
    [(UIButton *)[self.headView viewWithTag:888] setSelected:NO];
    [UIView animateWithDuration:0.5 animations:^{
        self.headView.transform = CGAffineTransformIdentity;
    }];
}

- (void)setInfo:(NSArray *)info
{
    if (_info != info) {
        _info = info;
        self.title.text = [self.info[self.collectionView.currentPage] title];
    }
}

@end
