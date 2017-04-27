//
//  DINEqualToAttribute.h
//  Dinas
//
//  Created by ziooooo on 17/3/23.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINOperationAttribute.h"
#import "DINTarget.h"

@interface DINEqualToAttribute : DINOperationAttribute

@property (strong ,nonatomic ,readonly)DINTarget *target;

+(instancetype)attributeWithTarget:(DINTarget *)target;

@end
