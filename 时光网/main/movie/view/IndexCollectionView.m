//
//  IndexCollectionView.m
//  时光网
//
//  Created by 汇文 on 15/11/9.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "IndexCollectionView.h"
#import "IndexCell.h"
#import "MoveInfo.h"

static NSString *identifier = @"IndexViewCell";

@implementation IndexCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self registerClass:[IndexCell class] forCellWithReuseIdentifier:identifier];
    }
    return self;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MoveInfo *info = self.info[indexPath.row];
    IndexCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    cell.info = info;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.currentPage != indexPath.row) {
        [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];

    }else
    self.currentPage = indexPath.row;
}

@end
