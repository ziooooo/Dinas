//
//  UIView+DINAdditions.m
//  Dinas
//
//  Created by ziooooo on 17/3/21.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "UIView+DINAdditions.h"

@implementation UIView (DINAdditions)

-(void)din_makeStructures:(void(^)(DINStructureMaker *make))block
{
    DINStructureMaker *maker = [[DINStructureMaker alloc] initWithView:self];
    block(maker);
}

#pragma mark - DINTargetProtocol

-(DINTarget *)createTarget
{
    return [[DINTarget alloc] initWithTarget:self targetType:kDINTargetTypeNormal];
}

#pragma mark - getters and setters

#define DIN_ATTR_FORWARD(attr) \
-(DINTarget *)din_##attr { \
    DINTarget *target = [[DINTarget alloc] initWithTarget:self targetType:kDINTargetType##attr]; \
    return target; \
} \

DIN_ATTR_FORWARD(Top)
DIN_ATTR_FORWARD(Left)
DIN_ATTR_FORWARD(Bottom)
DIN_ATTR_FORWARD(Right)
DIN_ATTR_FORWARD(Width)
DIN_ATTR_FORWARD(Height)
DIN_ATTR_FORWARD(CenterX)
DIN_ATTR_FORWARD(CenterY)

@end
