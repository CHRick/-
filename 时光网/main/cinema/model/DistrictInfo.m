//
//  DistrictInfo.m
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/10.
//  Copyright © 2015年 Rick. All rights reserved.
//

#import "DistrictInfo.h"

@implementation DistrictInfo

- (instancetype)initWithName:(NSString *)name districtID:(NSString *)districtID
{
    self = [super init];
    if (self) {
        self.name = name;
        self.districtID = districtID;
    }
    return self;
}

+ (instancetype)districtInfoWithName:(NSString *)name districtID:(NSNumber *)districtID
{
    return [[self alloc]initWithName:name districtID:districtID];
}

+(NSArray *)districtInfo
{
    NSMutableArray *arrayM = [NSMutableArray array];
    NSArray *array = [DataRequirst jsonData:@"district_list.json"][@"districtList"];
    for (NSDictionary *dic in array) {
        [arrayM addObject:[DistrictInfo districtInfoWithName:dic[@"name"] districtID:dic[@"ID"]]];
    }
    return arrayM;
}

@end
