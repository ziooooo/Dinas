//
//  DINBoxValue.m
//  Dinas
//
//  Created by ziooooo on 17/3/28.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINBoxValue.h"
#import "DINTarget.h"

@implementation DINBoxValue

-(DINTarget *)createTarget
{
    return [[DINTarget alloc] initWithTarget:self targetType:kDINTargetTypeNormal];
}

@end


