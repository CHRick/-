//
//  NewsViewController.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsModel.h"
#import "NewsCell.h"
#import "UIImageView+WebCache.h"
#import "DetailVC.h"
#import "ImageVC.h"

@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy) NSArray *newsInfo;

@property (nonatomic,strong) UIImageView *headerImageView;
@property (nonatomic,strong) UILabel *headerTitleLabel;

@end

@implementation NewsViewController

- (UIImageView *)headerImageView
{
    if (_headerImageView == nil) {
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, 150)];
        [self.view insertSubview:_headerImageView atIndex:0];
    }
    return _headerImageView;
}

- (UILabel *)headerTitleLabel
{
    if (_headerTitleLabel == nil) {
        _headerTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.headerImageView.frame) - 30, kScreenW, 30)];
        _headerTitleLabel.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        _headerTitleLabel.font = [UIFont systemFontOfSize:15];
        _headerTitleLabel.textColor = [UIColor whiteColor];
        [self.view insertSubview:_headerTitleLabel aboveSubview:_headerImageView];
    }
    return _headerTitleLabel;
}

- (NSArray *)newsInfo
{
    if (_newsInfo == nil) {
        _newsInfo = [NewsModel newsModel];
    }
    return _newsInfo;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tabelViewDataSuorce

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsInfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *news = self.newsInfo[indexPath.row];
    if (indexPath.row == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsHeadCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        self.headerTitleLabel.text = news.title;
        return cell;
    }
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NewsNormalCell"];
    [cell cellSetInfo:news];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row ? 60 : 150;
}

#pragma mark - 图片放大

//- (CGRect)rectForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scale = scrollView.contentOffset.y * -0.013 + 1;
//    CGFloat scale = (150 - scrollView.contentOffset.y) / 150;
    self.headerImageView.transform = (scrollView.contentOffset.y <=0) ? CGAffineTransformMakeScale(scale, scale) : CGAffineTransformMakeTranslation(0, -scrollView.contentOffset.y * 0.9);
    self.headerTitleLabel.frame = CGRectMake(0, CGRectGetMaxY(self.headerImageView.frame) - 30, kScreenW, 30);
}

#pragma  mark - tabelViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *news = self.newsInfo[indexPath.row];
    NSInteger type = [news.type integerValue];
    if (type == 0) {
        DetailVC *detaleVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailVC"];
        [self.navigationController pushViewController:detaleVC animated:YES];
    }else if (type == 1){
        ImageVC *imageVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ImageVC"];
        [self.navigationController pushViewController:imageVC animated:YES];
    }else if (type == 2){
        
    }
}



















@end
