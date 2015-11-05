//
//  NImageModel.m
//  时光网
//
//  Created by 汇文 on 15/11/5.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "NImageModel.h"

@implementation NImageModel

- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
+ (instancetype)NImageModelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc]initWithDictionary:dic];
}

+ (NSArray *)NImageModel
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [DataRequirst jsonData:@"image_list.json"];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[NImageModel NImageModelWithDictionary:dic]];
    }
    return arrayM;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"] || [key isEqualToString:@"ID"]) {
        self.imageID = value;
    }
}


@end
