//
//  MovieViewController.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MovieViewController.h"
#import "MoveInfo.h"
#import "MovieCell.h"
#import "PosterView.h"

@interface MovieViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) PosterView *posterView;
@property (nonatomic,copy) NSArray *movieInfo;

@end

@implementation MovieViewController

#pragma  mark - 懒加载

-(NSArray *)movieInfo
{
    if (_movieInfo == nil) {
        _movieInfo = [MoveInfo moveInfo];
    }
    return _movieInfo;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH - 64 - 49) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.hidden = YES;
        _tableView.rowHeight = 120;
        _tableView.allowsSelection = NO;
        _tableView.separatorColor = [UIColor darkGrayColor];
        [self.view insertSubview:_tableView aboveSubview:self.posterView];
    }
    return _tableView;
}

- (PosterView *)posterView
{
    if (_posterView == nil) {
        _posterView = [[PosterView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
        _posterView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
        _posterView.info = self.movieInfo;
        [self.view addSubview:_posterView];
    }
    return _posterView;
}

#pragma  mark - 加载视图

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createExchangeButton];
    [self createView];
    self.posterView.info = self.movieInfo;
}

#pragma mark - createView

- (void)createView
{
    [self tableView];
    [self posterView];
}

#pragma  mark - createExchangeButton

- (void)createExchangeButton
{
    UIButton *buttonView = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonView.frame = CGRectMake(0, 0, 60, 30);
    [buttonView setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:buttonView];
    
    UIButton *listButton = [UIButton buttonWithType:UIButtonTypeCustom];
    listButton.frame = buttonView.bounds;
    [listButton setImage:[UIImage imageNamed:@"list_home"] forState:UIControlStateNormal];
    [buttonView addSubview:listButton];
    listButton.tag = 888;
    listButton.hidden = YES;
    [listButton addTarget:self action:@selector(exchange:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *posterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    posterButton.frame = buttonView.bounds;
    [posterButton setImage:[UIImage imageNamed:@"poster_home"] forState:UIControlStateNormal];
    [buttonView addSubview:posterButton];
    posterButton.tag = 999;
    buttonView.hidden = NO;
    [posterButton addTarget:self action:@selector(exchange:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)exchange:(UIButton *)btn
{
    UIButton *list = (UIButton *)[btn.superview viewWithTag:888];
    UIButton *poster = (UIButton *)[btn.superview viewWithTag:999];
    
    list.hidden = !list.hidden;
    poster.hidden = !poster.hidden;
    
    self.tableView.hidden = list.hidden;
    self.posterView.hidden = poster.hidden;
    
    UIViewAnimationOptions option = list.hidden ? UIViewAnimationOptionTransitionFlipFromLeft : UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:btn.superview duration:0.5 options:option animations:^{


        [UIView transitionWithView:self.view duration:0.5 options:option animations:^{

        } completion:nil];
    } completion:nil];
    
}

#pragma mark - tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movieInfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RXCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"MovieCell" owner:self options:nil] lastObject];
    }
    
    [cell setMovieInfo:self.movieInfo[indexPath.row]];
    
    return cell;
}

@end
