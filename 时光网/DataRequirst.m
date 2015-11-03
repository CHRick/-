//
//  DataRequirst.m
//  时光网
//
//  Created by 汇文 on 15/11/3.
//  Copyright (c) 2015年 Rick. All rights reserved.
//

#import "dataRequirst.h"

@implementation DataRequirst

+ (id)jsonData:(NSString *)fileName
{
    return [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:[[NSBundle mainBundle]pathForResource:fileName ofType:nil]] options:NSJSONReadingMutableContainers error:nil];
    
}

@end
