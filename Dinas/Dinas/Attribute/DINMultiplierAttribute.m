//
//  DINMultiplierAttribute.m
//  Dinas
//
//  Created by ziooooo on 17/3/24.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINMultiplierAttribute.h"

@interface DINMultiplierAttribute()

@property (assign ,nonatomic ,readwrite)CGFloat multiplier;

@end

@implementation DINMultiplierAttribute

+(instancetype)attributeWithMultiplier:(CGFloat)multiplier
{
    DINMultiplierAttribute *attr = [[DINMultiplierAttribute alloc] init];
    attr.multiplier = multiplier;
    return attr;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"**MultiplierAttribute:  multiplier:%.2lf",self.multiplier];
}

@end
