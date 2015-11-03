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

@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,copy) NSArray *newsInfo;

@end

@implementation NewsViewController

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
        UIImageView *imageView = (UIImageView *)[cell.contentView viewWithTag:100];
        [imageView sd_setImageWithURL:[NSURL URLWithString:news.image]];
        UILabel *label = (UILabel *)[cell.contentView viewWithTag:101];
        label.text = news.title;
        label.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

@end
