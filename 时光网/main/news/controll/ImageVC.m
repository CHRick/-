//
//  ImageVC.m
//  时光网
//
//  Created by 汇文 on 15/11/5.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "ImageVC.h"
#import "NImageModel.h"
#import "NewsCVCell.h"
#import "UIImageView+WebCache.h"
#import "ScanImageVC.h"

static NSString *identifier = @"NewsCVCell";

@interface ImageVC ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UICollectionViewFlowLayout *flowLayout;

@property (nonatomic,copy) NSArray *imageInfo;

@end

@implementation ImageVC

- (NSArray *)imageInfo
{
    if (_imageInfo == nil) {
        _imageInfo = [NImageModel NImageModel];
    }
    return _imageInfo;
}

- (UICollectionViewFlowLayout *)flowLayout
{
    if (_flowLayout == nil) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        CGFloat width = kScreenW / 4;
        CGFloat height = width;
        _flowLayout.itemSize = CGSizeMake(width, height);
        _flowLayout.minimumInteritemSpacing = 0;
        _flowLayout.minimumLineSpacing = 0;
    }
    return _flowLayout;
}

- (UICollectionView *)collectionView
{
    if (_collectionView == nil) {
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) collectionViewLayout:self.flowLayout];
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerNib:[UINib nibWithNibName:@"NewsCVCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:identifier];
        _collectionView.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self collectionView];
    self.title = @"新闻图片";
}

#pragma mark - collectorViewdataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageInfo.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NImageModel *info = self.imageInfo[indexPath.row];
    NewsCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell.iconImage sd_setImageWithURL:[NSURL URLWithString:info.image]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ScanImageVC *scanVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ScanImageVC"];
    scanVC.index = indexPath.row;
    [self presentViewController:scanVC animated:YES completion:nil];
}


@end
