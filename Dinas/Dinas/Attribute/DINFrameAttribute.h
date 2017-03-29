//
//  DINFrameAttribute.h
//  Dinas
//
//  Created by ziooooo on 17/3/22.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINAttribute.h"

typedef NS_ENUM(NSInteger,DINFrameAttributeType) {
    kDINFrameAttributeTypeLeft,
    kDINFrameAttributeTypeTop,
    kDINFrameAttributeTypeRight,
    kDINFrameAttributeTypeBottom,
    kDINFrameAttributeTypeWidth,
    kDINFrameAttributeTypeHeight,
    kDINFrameAttributeTypeCenterX,
    kDINFrameAttributeTypeCenterY
};

@interface DINFrameAttribute : DINAttribute

+(instancetype)attributeWithType:(DINFrameAttributeType)attrType;

@property (assign ,nonatomic ,readonly)DINFrameAttributeType attrType;

@end

#define DIN_FRAMEATTR(type) \
    [DINFrameAttribute attributeWithType:(type)]

