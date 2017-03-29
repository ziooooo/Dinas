//
//  UIView+DINAdditions.h
//  Dinas
//
//  Created by ziooooo on 17/3/21.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DINStructureMaker.h"
#import "DINTarget.h"

@interface UIView (DINAdditions)<DINTargetProtocol>

@property (strong ,nonatomic ,readonly)DINTarget *din_Top;
@property (strong ,nonatomic ,readonly)DINTarget *din_Left;
@property (strong ,nonatomic ,readonly)DINTarget *din_Bottom;
@property (strong ,nonatomic ,readonly)DINTarget *din_Right;
@property (strong ,nonatomic ,readonly)DINTarget *din_Width;
@property (strong ,nonatomic ,readonly)DINTarget *din_Height;
@property (strong ,nonatomic ,readonly)DINTarget *din_CenterX;
@property (strong ,nonatomic ,readonly)DINTarget *din_CenterY;

-(void)din_makeStructures:(void(^)(DINStructureMaker *make))block;

@end



