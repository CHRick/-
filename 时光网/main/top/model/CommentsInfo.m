//
//  CommentsInfo.m
//  时光网
//
//  Created by 汇文 on 15/11/6.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "CommentsInfo.h"

@implementation CommentsInfo

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)commentsWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

// 存储了json文件中的所有数据，以commentsInfo类存储 
+ (NSArray *)comments
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [DataRequirst jsonData:@"movie_comment.json"][@"list"];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[CommentsInfo commentsWithDictionary:dic]];
    }
    return arrayM;
}

@end
