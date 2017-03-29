//
//  DINMultiplierAttribute.h
//  Dinas
//
//  Created by ziooooo on 17/3/24.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINOperationAttribute.h"

@interface DINMultiplierAttribute : DINOperationAttribute

@property (assign ,nonatomic ,readonly)CGFloat multiplier;

+(instancetype)attributeWithMultiplier:(CGFloat)multiplier;

@end
