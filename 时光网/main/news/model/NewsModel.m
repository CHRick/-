//
//  NewsModel.m
//  时光网
//
//  Created by 汇文 on 15/11/3.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)newsModelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

+ (NSArray *)newsModel
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"news_list.json" ofType:nil]] options:NSJSONReadingMutableContainers error:nil];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[self newsModelWithDictionary:dic]];
    }
    return arrayM;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"] || [key isEqualToString:@"ID"]) {
        self.newsID = value;
    }
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"{\n title:%@ summary:%@ image:%@ type:%@ ID:%@",self.title,self.summary,self.image,self.type,self.newsID];
}

@end
