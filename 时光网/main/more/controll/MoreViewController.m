//
//  MoreViewController.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MoreViewController.h"

@interface MoreViewController ()<UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *cahceSize;

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self countCahce];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [self countCahce];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)countCahce
{
    NSUInteger size = [[SDImageCache sharedImageCache] getSize];
    self.cahceSize.text = [NSString stringWithFormat:@"%.1fM",size/1024.0/1024.0];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        UIAlertView *alter = [[UIAlertView alloc]initWithTitle:@"清除缓存" message:@"确定清除" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alter.delegate = self;
        [alter show];
        [tableView cellForRowAtIndexPath:indexPath].selected = NO;
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex) {
        [[SDImageCache sharedImageCache] clearDisk];
        [self countCahce];
    }
}

@end
