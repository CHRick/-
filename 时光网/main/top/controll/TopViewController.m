//
//  TopViewController.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "TopViewController.h"
#import "TopModel.h"
#import "UIImageView+WebCache.h"
#import "StarView.h"
#import "RXTopCell.h"
#import "MDetailVC.h"

static NSString *indentifier = @"item";

@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,copy) NSArray *topInfo;

@end

@implementation TopViewController

#pragma mark - 懒加载

- (NSArray *)topInfo
{
    if (_topInfo == nil) {
        _topInfo = [TopModel topModel];
    }
    return _topInfo;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat width = kScreenW / 3;
        CGFloat height = width * 1.4;
        _flowLayout.itemSize = CGSizeMake(width, height + 20);
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64 - 49) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[RXTopCell class] forCellWithReuseIdentifier:indentifier];
        _collectionView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
}

#pragma mark - collectorViewdataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.topInfo.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TopModel *info = self.topInfo[indexPath.row];
    RXTopCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    [cell setTopInfo:info];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MDetailVC *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MDetailVC"];
    [self.navigationController pushViewController:detailVC animated:YES];
}


@end
