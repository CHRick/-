//
//  NImageModel.h
//  时光网
//
//  Created by 汇文 on 15/11/5.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NImageModel : NSObject

@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSNumber *imageID;
@property (nonatomic,copy) NSNumber *type;


@property (nonatomic,copy) NSArray *NImageModel;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)NImageModelWithDictionary:(NSDictionary *)dic;

+ (NSArray *)NImageModel;

@end
