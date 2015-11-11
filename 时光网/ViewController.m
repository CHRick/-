//
//  ViewController.m
//  时光网
//
//  Created by 汇文 on 15/10/31.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,copy) NSArray *images;
@property (nonatomic,copy) NSArray *imageViews;

@end

@implementation ViewController

- (NSArray *)images
{
    if (_images == nil) {
        NSMutableArray *arrayM = [NSMutableArray array];
        for (int i = 0; i < 24; i++) {
           [arrayM addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]]];
        }
        _images = arrayM;
    }
    return _images;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadImages];
    [self startAnimation];
}

- (void)loadImages
{
    CGFloat height = kScreenH / 6;
    CGFloat width = kScreenW / 4;
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < 24; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        imageView.image = self.images[i];
        [self.view addSubview:imageView];
        [arrayM addObject:imageView];
    }
    self.imageViews = arrayM;
}

- (void)startAnimation
{
    static int i = 1;
    if (i >= 24) {
        self.view.window.rootViewController = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
        return;
    }
    UIImageView *view = self.imageViews[i];
    int row = i / 4;
    int col = i % 4;
    
    CGFloat x = (0.5 + col) * view.width;
    CGFloat y = (row + 0.5) * view.height;
    [UIView animateWithDuration:0.5 animations:^{
        view.center = CGPointMake(x, y);
    }];
    
    [self performSelector:@selector(startAnimation) withObject:nil afterDelay:0.3];
    i++;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
