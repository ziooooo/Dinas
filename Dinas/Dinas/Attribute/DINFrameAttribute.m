//
//  DINFrameAttribute.m
//  Dinas
//
//  Created by ziooooo on 17/3/22.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINFrameAttribute.h"

@interface DINFrameAttribute ()

@property (assign ,nonatomic ,readwrite)DINFrameAttributeType attrType;

@end

@implementation DINFrameAttribute

+(instancetype)attributeWithType:(DINFrameAttributeType)attrType
{
    DINFrameAttribute *attr = [[DINFrameAttribute alloc] init];
    attr.attrType = attrType;
    return attr;
}

-(NSString *)description
{
    
    NSString *typeStr;
    
    switch (self.attrType) {
        case kDINFrameAttributeTypeCenterY:
            typeStr = @"CenterY";
            break;
        case kDINFrameAttributeTypeCenterX:
            typeStr = @"CenterX";
            break;
        case kDINFrameAttributeTypeHeight:
            typeStr = @"Height";
            break;
        case kDINFrameAttributeTypeWidth:
            typeStr = @"Width";
            break;
        case kDINFrameAttributeTypeBottom:
            typeStr = @"Bottom";
            break;
        case kDINFrameAttributeTypeRight:
            typeStr = @"Right";
            break;
        case kDINFrameAttributeTypeLeft:
            typeStr = @"Left";
            break;
        case kDINFrameAttributeTypeTop:
            typeStr = @"Top";
            break;
            
        default:
            typeStr = @"NotFound";
            break;
    }

    return [NSString stringWithFormat:@"--FrameAttribute:  Tpye:%@",typeStr];
}

@end
