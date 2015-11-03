//
//  TopModel.m
//  时光网
//
//  Created by 汇文 on 15/11/3.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "TopModel.h"

@implementation TopModel
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)topModelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

+ (NSArray *)topModel
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSDictionary *dict = [DataRequirst jsonData:@"top250.json"];
    for (NSDictionary *dic in dict[@"subjects"]) {
        [arrayM addObject:[TopModel topModelWithDictionary:dic]];
    }
    return arrayM;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"] || [key isEqualToString:@"ID"]) {
        self.topID = value;
    }
}

@end
