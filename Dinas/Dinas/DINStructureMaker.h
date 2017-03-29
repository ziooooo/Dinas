//
//  DINStructureMaker.h
//  Dinas
//
//  Created by ziooooo on 17/3/21.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DINStructure.h"

@interface DINStructureMaker : NSObject

-(instancetype)initWithView:(UIView *)view;

-(void(^)())build;

-(void(^)())debug;

@property (weak ,nonatomic ,readonly) UIView *view;

@property (strong ,nonatomic ,readonly) DINStructure *left;
@property (strong ,nonatomic ,readonly) DINStructure *top;
@property (strong ,nonatomic ,readonly) DINStructure *right;
@property (strong ,nonatomic ,readonly) DINStructure *bottom;
@property (strong ,nonatomic ,readonly) DINStructure *width;
@property (strong ,nonatomic ,readonly) DINStructure *height;
@property (strong ,nonatomic ,readonly) DINStructure *centerX;
@property (strong ,nonatomic ,readonly) DINStructure *centerY;


@property (strong ,nonatomic ,readonly) DINStructure *size;
@property (strong ,nonatomic ,readonly) DINStructure *center;
@property (strong ,nonatomic ,readonly) DINStructure *edge;

@end
