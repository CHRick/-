//
//  TopModel.h
//  时光网
//
//  Created by 汇文 on 15/11/3.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TopModel : NSObject

@property (nonatomic,copy) NSString *alt;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtype;
@property (nonatomic,copy) NSNumber *year;
@property (nonatomic,copy) NSString *original_title;
@property (nonatomic,copy) NSNumber *topID;
@property (nonatomic,copy) NSNumber *collect_count;
@property (nonatomic,copy) NSDictionary *rating;
@property (nonatomic,copy) NSDictionary *images;

@property (nonatomic,copy) NSArray *topModel;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)topModelWithDictionary:(NSDictionary *)dic;

+ (NSArray *)topModel;

@end
