//
//  MDetailVC.m
//  时光网
//
//  Created by 汇文 on 15/11/6.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MDetailVC.h"
#import "CommentsInfo.h"
#import "MDetailHeadCell.h"
#import "MDetailCommentCell.h"

@interface MDetailVC ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,copy) NSArray *comments; // 评论等信息，存commentsInfo的类

@property (nonatomic,copy) NSDictionary *details; // 影片信息
@property (nonatomic,strong) NSIndexPath *index; // 选中单元格的indexPath
@property (nonatomic,assign) float height; // 根据评论计算的行高

@end

@implementation MDetailVC

// 加载影片信息
- (NSDictionary *)details
{
    if (_details == nil) {
        _details = [DataRequirst jsonData:@"movie_detail.json"];
    }
    return _details;
}
// 加载评论信息
- (NSArray *)comments
{
    if (_comments == nil) {
        _comments = [CommentsInfo comments];
    }
    return _comments;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2 + self.comments.count;
}


// 加载单元格
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        MDetailHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HeaderCell"];
        cell.info = self.details;
        return cell;
        
    }else if (indexPath.row == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        for (int i = 0; i < 4; i++) {
            [(UIImageView *)[cell.contentView viewWithTag:200 + i] sd_setImageWithURL:[NSURL URLWithString:[self.details[@"images"] objectAtIndex:i]]];
        }
        return cell;
        
    }else{
        CommentsInfo *info = self.comments[indexPath.row - 2];
        MDetailCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
        cell.info = info;
        return cell;
    }
}


// 根据index的值，返回cell行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }else if(indexPath.row == 1)
    {
        return 80;
    }else{
        if (self.index != 0) {
            if (indexPath == self.index) {
                return self.height;
            }
        }
        return 80;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= 2) {
        // 计算评论的frame值
        NSString *text = [self.comments[indexPath.row - 2] content];
        CGRect frame = [text boundingRectWithSize:CGSizeMake(218, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}context:nil];
        // 设置单元格行高
        self.height = frame.size.height + 60;
        // 传递被选中cell的indexPath
        self.index = indexPath;
        
        [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
