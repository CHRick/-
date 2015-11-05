//
//  NewsImageModel.m
//  时光网
//
//  Created by 汇文 on 15/11/5.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "NewsImageModel.h"

@implementation NewsImageModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)newsImageModelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

+ (NSArray *)newsImageModel
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [DataRequirst jsonData:@"news_detail_images.json"];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[NewsImageModel newsImageModelWithDictionary:dic]];
    }
    return arrayM;
}


@end
