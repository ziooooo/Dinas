//
//  DINTarget.h
//  Dinas
//
//  Created by ziooooo on 17/3/27.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DINTargetProtocol.h"

typedef NS_ENUM(NSInteger ,DINTargetType) {
    kDINTargetTypeNormal = 0,
    kDINTargetTypeTop,
    kDINTargetTypeLeft,
    kDINTargetTypeBottom,
    kDINTargetTypeRight,
    kDINTargetTypeWidth,
    kDINTargetTypeHeight,
    kDINTargetTypeCenterX,
    kDINTargetTypeCenterY
};

@interface DINTarget : NSObject<DINTargetProtocol>

@property (strong ,nonatomic ,readonly)id target;

@property (assign ,nonatomic)DINTargetType targetType;

-(instancetype)initWithTarget:(id)target targetType:(DINTargetType)targetType;

@end



@interface DINTarget (PositionValue)

-(CGFloat)targetValueWithRect:(CGRect)rect;

@end


@interface DINTarget (BoxValue)

-(CGFloat)boxValue;

@end


