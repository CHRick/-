//
//  NewsModel.h
//  时光网
//
//  Created by 汇文 on 15/11/3.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *summary;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSNumber *type;
@property (nonatomic,copy) NSNumber *newsID;

@property (nonatomic,copy) NSArray *newsModel;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)newsModelWithDictionary:(NSDictionary *)dic;

+ (NSArray *)newsModel;

@end
