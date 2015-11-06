//
//  ScanImageVC.m
//  时光网
//
//  Created by 汇文 on 15/11/5.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "ScanImageVC.h"
#import "NImageModel.h"
#import "ScanImageCollectionView.h"

static NSString *identifier = @"normal";

@interface ScanImageVC ()<UIScrollViewDelegate>

@property (nonatomic,copy) NSArray *imageArray;
@property (nonatomic,strong) ScanImageCollectionView *collectionView;

@end

@implementation ScanImageVC

#pragma mark - 懒加载

-(NSArray *)imageArray
{
    if (_imageArray == nil) {
        _imageArray = [NImageModel NImageModel];
    }
    return _imageArray;
}

- (void)createCollectionView
{
    self.collectionView = [[ScanImageCollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.imageInfo = self.imageArray;
    [self.view addSubview:self.collectionView];
    [self.collectionView scrollToItemAtIndexPath:self.indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally  animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createCollectionView];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem = back;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeNavBar) name:KTapNotification object:nil];
    
    UINavigationController *nav = self.navigationController;
    [nav.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    nav.navigationBar.barStyle = UIBarStyleBlack;
    nav.navigationBar.translucent = YES;
}

- (void)closeNavBar
{
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBar.hidden animated:YES];
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
