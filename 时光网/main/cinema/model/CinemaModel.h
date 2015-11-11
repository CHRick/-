//
//  CinemaModel.h
//  时光网
//
//  Created by huiwenjiaoyu on 15/11/10.
//  Copyright © 2015年 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@interface CinemaModel : BaseModel

@property (nonatomic,copy) NSString *address;
@property (nonatomic,copy) NSNumber *lowPrice;
@property (nonatomic,copy) NSNumber *grade;
@property (nonatomic,copy) NSString *coord;
@property (nonatomic,copy) NSString *distance;
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSNumber *cinemaID;
@property (nonatomic,copy) NSString *msg;
@property (nonatomic,copy) NSString *districtId;
@property (nonatomic,copy) NSString *tel;
@property (nonatomic,copy) NSString *isSeatSupport;
@property (nonatomic,copy) NSString *isCouponSupport;
@property (nonatomic,copy) NSString *isImaxSupport;
@property (nonatomic,copy) NSString *isGroupBuySupport;
@property (nonatomic,copy) NSString *circleName;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)cinemaModelWithDictionary:(NSDictionary *)dic;

+ (NSArray *)cinemaModel;


@end
