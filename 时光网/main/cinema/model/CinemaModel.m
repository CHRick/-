//
//  CinemaModel.m
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/10.
//  Copyright © 2015年 Rick. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        self = [self initContentWithDic:dic];
    }
    return self;
}

+ (instancetype)cinemaModelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

+ (NSArray *)cinemaModel
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [DataRequirst jsonData:@"cinema_list.json"][@"cinemaList"];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[CinemaModel cinemaModelWithDictionary:dic]];
    }
    return arrayM;
}

- (NSDictionary *)attributeMapDictionary:(NSDictionary *)jsonDic {
    
    NSMutableDictionary *mapDic = [NSMutableDictionary dictionary];
    
    for (id key in jsonDic) {
        if ([key isEqualToString:@"ID"]) {
            [mapDic setObject:@"cinemaID" forKey:key];
        }else{
            [mapDic setObject:key forKey:key];
        }
    }
    
    return mapDic;
}

@end
