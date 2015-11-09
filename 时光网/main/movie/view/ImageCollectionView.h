//
//  ImageCollectionView.h
//  时光网
//
//  Created by 汇文 on 15/11/9.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCollectionView : UICollectionView<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,assign) CGFloat pageWidth;
@property (nonatomic,copy) NSArray *info;
@property (nonatomic,assign) NSInteger currentPage;


@end
