//
//  MoveInfo.m
//  时光网
//
//  Created by 汇文 on 15/11/2.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "MoveInfo.h"

@implementation MoveInfo

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)moveInfoWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}
+ (NSArray *)moveInfo
{
    NSMutableArray *arrayM = [NSMutableArray array];
//    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"us_box.json" ofType:nil]];
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    NSDictionary *dic = [DataRequirst jsonData:@"us_box.json"];
    for (NSDictionary *dict in dic[@"subjects"]) {
        MoveInfo *info = [MoveInfo moveInfoWithDictionary:dict[@"subject"]];
        [arrayM addObject:info];
    }
    return arrayM;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"] || [key isEqualToString:@"ID"]) {
        self.myID = value;
    }
}



@end
