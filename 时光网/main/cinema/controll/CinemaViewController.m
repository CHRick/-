//
//  CinemaViewController.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaModel.h"
#import "DistrictInfo.h"
#import "CinemaListCell.h"

@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,copy) NSArray *districtList;
@property (nonatomic,copy) NSArray *cinemaList;
@property (nonatomic,copy) NSDictionary *dic;

@property (nonatomic,copy) NSMutableDictionary *infoDic;

@property (nonatomic,copy) NSMutableArray *sectionIsFlod;


@end

@implementation CinemaViewController

#pragma  mark - 懒加载

- (NSMutableArray *)sectionIsFlod
{
    if (_sectionIsFlod == nil) {
        _sectionIsFlod = [NSMutableArray array];
        for (int i = 0; i < self.districtList.count; i++) {
            [_sectionIsFlod addObject:@NO];
        }
    }
    return _sectionIsFlod;
}

- (NSMutableDictionary *)infoDic
{
    if (_infoDic == nil) {
        _infoDic = [self.dic mutableCopy];
    }
    return _infoDic;
}

- (NSDictionary *)dic
{
    if (_dic == nil) {
        NSMutableDictionary *dicM = [NSMutableDictionary dictionary];
        for (DistrictInfo *info in self.districtList) {
            NSMutableArray *arrayM = [NSMutableArray array];
            for (CinemaModel *cinema in self.cinemaList) {
                if ([cinema.districtId integerValue] == [info.districtID integerValue]) {
                    [arrayM addObject:cinema];
                }
            }
            [dicM setObject:arrayM forKey:info.name];
        }
        _dic = dicM;
    }
    return _dic;
}

- (NSArray *)districtList
{
    if (_districtList == nil) {
        _districtList = [DistrictInfo districtInfo];
    }
    return _districtList;
}

- (NSArray *)cinemaList
{
    if (_cinemaList == nil) {
        _cinemaList = [CinemaModel cinemaModel];
    }
    return _cinemaList;
}

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 80;
        _tableView.sectionFooterHeight = 0;
        _tableView.sectionHeaderHeight = 40;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self dic];
    [self tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma  mark - tabelView DatasSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.sectionIsFlod[section] boolValue] == YES) {
        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSString *key in self.dic) {
            [arrayM addObject:key];
        }
        return [[self.dic objectForKey:arrayM[section]] count];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (NSString *key in self.dic) {
        [arrayM addObject:key];
    }
    CinemaModel *info = [[self.dic objectForKey:arrayM[indexPath.section]] objectAtIndex:indexPath.row];
    
    CinemaListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CinemaCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"CinemaListCell" owner:nil options:nil]lastObject];
    }
    cell.info = info;
    return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.districtList.count;
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, kScreenW, 40);
    UIImage *image = [UIImage imageNamed:@"btnbg_blue"];
    image = [image stretchableImageWithLeftCapWidth:10 topCapHeight:10];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle:[self.districtList[section] name] forState:UIControlStateNormal];
    button.tag = section;
    [button addTarget:self action:@selector(scrollSection:) forControlEvents:UIControlEventTouchUpInside];
    return button;
}

- (void)scrollSection:(UIButton *)btn
{
    if ([self.sectionIsFlod[btn.tag] boolValue] == NO) {
        [self.sectionIsFlod replaceObjectAtIndex:btn.tag withObject:@YES];
    }else{
        [self.sectionIsFlod replaceObjectAtIndex:btn.tag withObject:@NO];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationFade];
}


@end
