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
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:indentifier];
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
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:indentifier forIndexPath:indexPath];
    for (UIView *view in cell.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, cell.frame.size.width - 20, cell.frame.size.height - 5 - 20)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:info.images[@"medium"]]];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.bounds.size.height - 20, imageView.bounds.size.width, 20)];
    title.text = info.title;
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:14];
    [imageView addSubview:title];
    [cell.contentView addSubview:imageView];
    
    float rate = [info.rating[@"average"] floatValue] / 10;
    StarView *star = [[StarView alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView.frame) + 5, 0 , 11) withStars:rate];
    [cell.contentView addSubview:star];
    
    UILabel *ratingLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(star.frame) + 5, CGRectGetMinY(star.frame), 20, 10)];
    ratingLabel.textColor = [UIColor whiteColor];
    ratingLabel.font = [UIFont systemFontOfSize:13];
    ratingLabel.text = [NSString stringWithFormat:@"%.1f",[info.rating[@"average"] floatValue]];
    [cell.contentView addSubview:ratingLabel];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
