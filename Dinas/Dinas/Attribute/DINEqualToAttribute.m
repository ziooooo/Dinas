//
//  DINEqualToAttribute.m
//  Dinas
//
//  Created by ziooooo on 17/3/23.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINEqualToAttribute.h"

@interface DINEqualToAttribute()<NSMutableCopying>

@property (strong ,nonatomic ,readwrite)DINTarget *target;

@end

@implementation DINEqualToAttribute

+(instancetype)attributeWithTarget:(DINTarget *)target
{
    DINEqualToAttribute *attr = [[DINEqualToAttribute alloc] init];
    attr.target = target;
    return attr;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"**EqualToAttribute:  Target:%@",@""];
}

#pragma mark - NSMutableCopying

-(id)mutableCopyWithZone:(NSZone *)zone
{
    DINEqualToAttribute *attr = [DINEqualToAttribute attributeWithTarget:self.target.mutableCopy];
    return attr;
}

@end
