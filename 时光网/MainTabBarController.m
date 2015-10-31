//
//  MainTabBarController.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MainTabBarController.h"
#import "RXBarItem.h"


@interface MainTabBarController ()

@end

@implementation MainTabBarController

#pragma mark - 自定义TabBar

- (void)createTabBar
{
    for(UIView *view in self.tabBar.subviews)
    {
        Class class = NSClassFromString(@"UITabBarButton");
        if([view isKindOfClass:class])
        {
            [view removeFromSuperview];
        }
    }
    CGFloat btnW = self.tabBar.bounds.size.width / self.viewControllers.count;
    
    NSArray *array = @[
                       @"movie_home",
                       @"msg_new",
                       @"start_top250",
                       @"icon_cinema",
                       @"more_setting"
                       ];
    NSArray *arrayTitle = @[
                            @"电影",
                            @"新闻",
                            @"top",
                            @"影院",
                            @"更多"
                            ];
    //选中背景视图
    UIImageView *bgSelected = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1"]];
    bgSelected.frame = CGRectMake(0, 0, btnW, 49);
    bgSelected.tag = 88888;
    [self.tabBar addSubview:bgSelected];
    
    for (int i = 0;i < self.viewControllers.count;i ++)
    {
        
        CGRect frame = CGRectMake(i * btnW, 0, btnW, 49);
        RXBarItem *btn = [[RXBarItem alloc]initWithFrame:frame withImageName:array[i] withTitle:arrayTitle[i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(changeWindow:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:btn];
    }
    
    
}

- (void)changeWindow:(UIButton *)button
{
    self.selectedIndex = button.tag;
    [UIView animateWithDuration:0.3 animations:^{
        [(UIImageView *)[self.tabBar viewWithTag:88888] setCenter:button.center];
    }];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self createTabBar];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
