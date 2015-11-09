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

@property (nonatomic,copy) NSArray *comments;

@property (nonatomic,copy) NSDictionary *details;

@end

@implementation MDetailVC

- (NSDictionary *)details
{
    if (_details == nil) {
        _details = [DataRequirst jsonData:@"movie_detail.json"];
    }
    return _details;
}

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
    return 3 + self.comments.count;
}

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
        CommentsInfo *info = self.comments[indexPath.row];
        MDetailCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell"];
        cell.info = info;
        return cell;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 150;
    }else if(indexPath.row == 1)
    {
        return 80;
    }else{
        
//        NSLog(@"%i",[(MDetailCommentCell *)[tableView cellForRowAtIndexPath:indexPath] isSelected]);
        return 80;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >= 2) {
        MDetailCommentCell *cell = (MDetailCommentCell *)[tableView cellForRowAtIndexPath:indexPath];
        NSString *text = [self.comments[indexPath.row] content];
        CGRect frame = [text boundingRectWithSize:CGSizeMake(247, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]}context:nil];
//        cell.rowHeight = frame.size.height + 60;
//        NSLog(@"%f",cell.rowHeight);
    }
}

@end
