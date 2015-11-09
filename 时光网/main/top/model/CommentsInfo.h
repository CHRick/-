//
//  CommentsInfo.h
//  时光网
//
//  Created by 汇文 on 15/11/6.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentsInfo : NSObject

@property (nonatomic,copy) NSString *userImage;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSNumber *rating;
@property (nonatomic,copy) NSString *content;

- (instancetype)initWithDictionary:(NSDictionary *)dic;
+ (instancetype)commentsWithDictionary:(NSDictionary *)dic;

+ (NSArray *)comments;

@end
