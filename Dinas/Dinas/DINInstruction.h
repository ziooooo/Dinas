//
//  DINInstruction.h
//  Dinas
//
//  Created by ziooooo on 17/3/23.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINFrameAttribute.h"
#import "DINEqualToAttribute.h"
#import "DINMultiplierAttribute.h"
#import "DINOffsetAttribute.h"

@interface DINInstruction : NSObject

-(instancetype)initWithFrameAttr:(DINFrameAttribute *)frameAttr;

@property (strong ,nonatomic)DINFrameAttribute *frameAttr;

@property (strong ,nonatomic)DINEqualToAttribute *equalToAttr;

@property (strong ,nonatomic)DINMultiplierAttribute *multiplierAttr;

@property (strong ,nonatomic)DINOffsetAttribute *offsetAttr;


-(CGFloat)executeWithRelativeView:(UIView *)relativeView;

-(DINFrameAttributeType)attrType;
-(DINTarget *)target;
-(CGFloat)multiplier;
-(CGFloat)offset;

@end
