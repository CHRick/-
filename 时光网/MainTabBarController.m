//
//  MainTabBarController.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MainTabBarController.h"
#import "RXBarItem.h"

#define kBtnW self.tabBar.bounds.size.width / self.viewControllers.count


@interface MainTabBarController ()
@property (nonatomic,strong) UIImageView *bgSelected;

@end

@implementation MainTabBarController

- (UIImageView *)bgSelected
{
    if(_bgSelected == nil)
    {
        _bgSelected = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"selectTabbar_bg_all1"]];
        _bgSelected.frame = CGRectMake(0, 0, kBtnW, 49);
        [self.tabBar addSubview:_bgSelected];

    }
    return _bgSelected;
}

#pragma mark - 自定义TabBar

/**
 *  创建自定义工具栏
 */
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
    [self bgSelected];
    //创建工具栏按钮
    for (int i = 0;i < self.viewControllers.count;i ++)
    {
        
        CGRect frame = CGRectMake(i * kBtnW, 0, kBtnW, 49);
        RXBarItem *btn = [[RXBarItem alloc]initWithFrame:frame withImageName:array[i] withTitle:arrayTitle[i]];
        btn.tag = i;
        [btn addTarget:self action:@selector(changeWindow:) forControlEvents:UIControlEventTouchUpInside];
        [self.tabBar addSubview:btn];
    }
    
    
}
/**
 *  工具栏
 *
 *  @param button <#button description#>
 */
- (void)changeWindow:(UIButton *)button
{
    self.selectedIndex = button.tag;
    [UIView animateWithDuration:0.3 animations:^{
        self.bgSelected.center = button.center;
    }];
}

#pragma mark -

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.backgroundImage = [UIImage imageNamed:@"tab_bg_all"];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    
//    [[UINavigationBar appearance] setTitleTextAttributes:@{
//                                                          NSForegroundColorAttributeName:[UIColor blackColor]
//                                                          }];
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
