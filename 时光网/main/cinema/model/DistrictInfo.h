//
//  DistrictInfo.h
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/10.
//  Copyright © 2015年 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DistrictInfo : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *districtID;

- (instancetype)initWithName:(NSString *)name districtID:(NSNumber *)districtID;
+ (instancetype)districtInfoWithName:(NSString *)name districtID:(NSNumber *)districtID;

+(NSArray *)districtInfo;

@end
