//
//  DINInstruction.m
//  Dinas
//
//  Created by ziooooo on 17/3/23.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINInstruction.h"
#import "DINBoxValue.h"

@implementation DINInstruction

-(instancetype)initWithFrameAttr:(DINFrameAttribute *)frameAttr
{
    if (self = [super init]) {
        self.frameAttr = frameAttr;
    }
    return self;
}

#pragma mark - private methods

-(CGFloat)executeWithRelativeView:(UIView *)relativeView
{
    if ([self.target.target isKindOfClass:DINBoxValue.class]) {
        
        CGFloat boxValue = [self.target boxValue];
        
        switch (self.attrType) {
            case kDINFrameAttributeTypeWidth:
            case kDINFrameAttributeTypeHeight:
            case kDINFrameAttributeTypeCenterX:
            case kDINFrameAttributeTypeCenterY:
                return boxValue;
                break;
            default:
                break;
        }
        
        
    }

    UIView *targetView = self.target.target;
    CGRect relativeRect ;
    if (relativeView.superview == targetView) {
        relativeRect = targetView.bounds;
    }
    else{
        relativeRect = [targetView.superview?targetView.superview:targetView convertRect:targetView.frame toView:relativeView.superview];
    }
    
    CGFloat targetValue = [self.target targetValueWithRect:relativeRect];
    
    switch (self.attrType) {
        case kDINFrameAttributeTypeTop:
        case kDINFrameAttributeTypeLeft:
        case kDINFrameAttributeTypeBottom:
        case kDINFrameAttributeTypeRight:{
            return targetValue + self.offset;
        }
            break;
        case kDINFrameAttributeTypeCenterX:{
            CGFloat multiplierOffset = (self.multiplier - 1) * targetView.bounds.size.width;
            return targetValue + multiplierOffset + self.offset;
        }
            break;
        case kDINFrameAttributeTypeCenterY:{
            CGFloat multiplierOffset = (self.multiplier - 1) * targetView.bounds.size.height;
            return targetValue + multiplierOffset + self.offset;
        }
            break;
        case kDINFrameAttributeTypeWidth:{
            return targetValue * self.multiplier + self.offset;
        }
            break;
        case kDINFrameAttributeTypeHeight:{
            return targetValue * self.multiplier + self.offset;
        }
            break;
            
        default:
            break;
    }
    
    return 0;
}

-(DINFrameAttributeType)attrType
{
    return self.frameAttr.attrType;
}

-(DINTarget *)target
{
    return self.equalToAttr.target;
}

-(CGFloat)multiplier
{
    if (!self.multiplierAttr) {
        return 1;
    }
    return self.multiplierAttr.multiplier;
}

-(CGFloat)offset
{
    return self.offsetAttr.offset;
}

#pragma mark - getters and setters
-(void)setEqualToAttr:(DINEqualToAttribute *)equalToAttr
{
    
#define DIN_CASE_FORWARD(attr)  \
    case kDINFrameAttributeType##attr: \
        equalToAttr.target.targetType = kDINTargetType##attr; \
        break; \

    if (equalToAttr.target.targetType == kDINTargetTypeNormal) {
        switch (self.attrType) {
                DIN_CASE_FORWARD(Top)
                DIN_CASE_FORWARD(Left)
                DIN_CASE_FORWARD(Bottom)
                DIN_CASE_FORWARD(Right)
                DIN_CASE_FORWARD(Width)
                DIN_CASE_FORWARD(Height)
                DIN_CASE_FORWARD(CenterX)
                DIN_CASE_FORWARD(CenterY)
            default:
                break;
        }
    }
    _equalToAttr = equalToAttr;
}

-(NSString *)description
{
    return [NSString stringWithFormat:@"!!DINInstruction:  %@  %@  %@  %@",self.frameAttr,self.equalToAttr,self.multiplierAttr,self.offsetAttr];
}

@end
