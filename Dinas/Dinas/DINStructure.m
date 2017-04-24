//
//  DINStructure.m
//  Dinas
//
//  Created by ziooooo on 17/3/22.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINStructure.h"
#import "DINStructureMaker.h"

@implementation DINStructure

-(DINStructure *(^)(id<DINTargetProtocol>))equalTo
{
    return ^DINStructure *(id<DINTargetProtocol> target){
        DINEqualToAttribute *attr = [DINEqualToAttribute attributeWithTarget:[target createTarget]];
        return [self.delegate structure:self addStructureWithAttribute:attr];
    };
}

-(DINStructure *(^)())equalToSuperview
{
    return ^DINStructure *(){
        if (![self.delegate isKindOfClass:DINStructureMaker.class]) NSAssert(0, @"error delegate");
        DINStructureMaker *maker = (DINStructureMaker *)self.delegate;
        DINTarget *target = [[DINTarget alloc] initWithTarget:maker.view.superview targetType:kDINTargetTypeNormal];
        DINEqualToAttribute *attr = [DINEqualToAttribute attributeWithTarget:[target createTarget]];
        return [self.delegate structure:self addStructureWithAttribute:attr];
    };
}

-(DINStructure * (^)(CGFloat))multiplierBy
{
    return ^DINStructure *(CGFloat multiplier){
        DINMultiplierAttribute *attr = [DINMultiplierAttribute attributeWithMultiplier:multiplier];
        return [self.delegate structure:self addStructureWithAttribute:attr];
    };
}

-(void (^)(CGFloat))offset
{
    return ^(CGFloat offset){
        DINOffsetAttribute *attr = [DINOffsetAttribute attributeWithOffset:offset];
        [self.delegate structure:self addStructureWithAttribute:attr];
    };
}

-(DINStructure *)with
{
    return self;
}

-(DINStructure *)and
{
    return self;
}

- (DINStructure *)left
{
    return [self.delegate structure:self addStructureWithAttribute:DIN_FRAMEATTR(kDINFrameAttributeTypeLeft)];
}
- (DINStructure *)top
{
    return [self.delegate structure:self addStructureWithAttribute:DIN_FRAMEATTR(kDINFrameAttributeTypeTop)];
}
- (DINStructure *)right
{
    return [self.delegate structure:self addStructureWithAttribute:DIN_FRAMEATTR(kDINFrameAttributeTypeRight)];
}
- (DINStructure *)bottom
{
    return [self.delegate structure:self addStructureWithAttribute:DIN_FRAMEATTR(kDINFrameAttributeTypeBottom)];
}
- (DINStructure *)width
{
    return [self.delegate structure:self addStructureWithAttribute:DIN_FRAMEATTR(kDINFrameAttributeTypeWidth)];
}
- (DINStructure *)height
{
    return [self.delegate structure:self addStructureWithAttribute:DIN_FRAMEATTR(kDINFrameAttributeTypeHeight)];
}
- (DINStructure *)centerX
{
    return [self.delegate structure:self addStructureWithAttribute:DIN_FRAMEATTR(kDINFrameAttributeTypeCenterX)];
}
- (DINStructure *)centerY{
    return [self.delegate structure:self addStructureWithAttribute:DIN_FRAMEATTR(kDINFrameAttributeTypeCenterY)];
}

@end
