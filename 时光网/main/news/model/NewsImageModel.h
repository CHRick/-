//
//  NewsImageModel.h
//  时光网
//
//  Created by 汇文 on 15/11/5.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsImageModel : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *url1;
@property (nonatomic,copy) NSString *url2;

@property (nonatomic,copy) NSArray *newsImageModel;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)newsImageModelWithDictionary:(NSDictionary *)dic;

+ (NSArray *)newsImageModel;

@end
