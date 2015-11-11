//
//  PosterCollectionView.m
//  时光网
//
//  Created by 汇文 on 15/11/7.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterViewCell.h"
#import "MoveInfo.h"

static NSString *identifier = @"PosterViewCell";

@implementation PosterCollectionView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerClass:[PosterViewCell class] forCellWithReuseIdentifier:identifier];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoveInfo *info = self.info[indexPath.row];
    PosterViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.info = info;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentPage == indexPath.row) {
        PosterViewCell *cell = (PosterViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell flip];
    }else{
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
    self.currentPage = indexPath.row;
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s",__func__);
}

@end
