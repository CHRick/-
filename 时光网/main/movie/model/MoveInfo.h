//
//  MoveInfo.h
//  时光网
//
//  Created by 汇文 on 15/11/2.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MoveInfo : NSObject

@property (nonatomic,copy) NSDictionary *rating;
@property (nonatomic,copy) NSString *collect_count;
@property (nonatomic,copy) NSDictionary *images;
@property (nonatomic,copy) NSNumber *mId;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtype;
@property (nonatomic,copy) NSNumber *year;
@property (nonatomic,copy) NSString *original_title;
@property (nonatomic,copy) NSString *alt;
@property (nonatomic,copy) NSNumber *myID;

@property (nonatomic,copy) NSArray *moveInfo;

-(instancetype)initWithDictionary:(NSDictionary *)dic;
+(instancetype)moveInfoWithDictionary:(NSDictionary *)dic;
+(NSArray *)moveInfo;



@end
