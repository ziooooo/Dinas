//
//  DINOffsetAttribute.m
//  Dinas
//
//  Created by ziooooo on 17/3/24.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINOffsetAttribute.h"

@interface DINOffsetAttribute()

@property (assign ,nonatomic ,readwrite)CGFloat offset;

@end

@implementation DINOffsetAttribute

+(instancetype)attributeWithOffset:(CGFloat)offset
{
    DINOffsetAttribute *attr = [[DINOffsetAttribute alloc] init];
    attr.offset = offset;
    return attr;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"**OffsetAttribute:  offset:%.2lf",self.offset];
}

@end
