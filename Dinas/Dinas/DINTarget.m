//
//  DINTarget.m
//  Dinas
//
//  Created by ziooooo on 17/3/27.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINTarget.h"
#import "DINBoxValue.h"

@interface DINTarget()<NSMutableCopying>

@property (strong ,nonatomic ,readwrite)id target;

@end

@implementation DINTarget

-(instancetype)initWithTarget:(id)target targetType:(DINTargetType)targetType
{
    if (self = [super init]) {
        self.target = target;
        self.targetType = targetType;
    }
    return self;
}

#pragma mark - DINTargetProtocol

-(DINTarget *)createTarget
{
    return self;
}

#pragma mark - NSMutableCopying

-(id)mutableCopyWithZone:(NSZone *)zone
{
    DINTarget *target = [[DINTarget alloc] initWithTarget:self.target targetType:self.targetType];
    return target;
    
}

@end


@implementation DINTarget (PositionValue)

-(CGFloat)targetValueWithRect:(CGRect)rect
{
    if (![self.target isKindOfClass:[UIView class]]) return 0;
    
    CGFloat value = 0;
    
    switch (self.targetType) {
        case kDINTargetTypeTop:
            value = rect.origin.y;
            break;
        case kDINTargetTypeLeft:
            value = rect.origin.x;
            break;
        case kDINTargetTypeBottom:
            value = rect.origin.y + rect.size.height;
            break;
        case kDINTargetTypeRight:
            value = rect.origin.x + rect.size.width;
            break;
        case kDINTargetTypeWidth:
            value = rect.size.width;
            break;
        case kDINTargetTypeHeight:
            value = rect.size.height;
            break;
        case kDINTargetTypeCenterX:
            value = rect.origin.x + rect.size.width / 2;
            break;
        case kDINTargetTypeCenterY:
            value = rect.origin.y + rect.size.height / 2;
            break;
        default:
            break;
    }
    
    return value;
}

@end

@implementation DINTarget (BoxValue)

-(CGFloat)boxValue
{
    if (![self.target isKindOfClass:[DINBoxValue class]]) return 0;
    
    DINBoxValue *boxValue = self.target;
    NSValue *value = boxValue.value;
    const char *type = value.objCType;
    
    CGFloat finalValue = 0;
    
    
    if (strcmp(type, @encode(CGSize)) == 0) {//只处理size
        CGSize size = [value CGSizeValue];
        if (self.targetType == kDINTargetTypeWidth) {
            finalValue = size.width;
        }
        else if (self.targetType == kDINTargetTypeHeight) {
            finalValue = size.height;
        }
    }
    else if (strcmp(type, @encode(CGPoint)) == 0){//只处理center
        CGPoint point = [value CGPointValue];
        if (self.targetType == kDINTargetTypeCenterX) {
            finalValue = point.x;
        }
        else if (self.targetType == kDINTargetTypeCenterY){
            finalValue = point.y;
        }
    }
    else if (   strcmp(type, @encode(double)) == 0
             || strcmp(type, @encode(float)) == 0
             || strcmp(type, @encode(int)) == 0
             || strcmp(type, @encode(long)) == 0
             || strcmp(type, @encode(long long)) == 0
             || strcmp(type, @encode(short)) == 0
             || strcmp(type, @encode(unsigned int)) == 0
             || strcmp(type, @encode(unsigned long)) == 0
             || strcmp(type, @encode(unsigned long long)) == 0
             || strcmp(type, @encode(unsigned short)) == 0) {
        if (self.targetType == kDINTargetTypeWidth || self.targetType == kDINTargetTypeHeight) {
            NSNumber *numValue = (NSNumber *)value;
            finalValue = [numValue doubleValue];
        }
    }
    
    return finalValue;
}

@end

