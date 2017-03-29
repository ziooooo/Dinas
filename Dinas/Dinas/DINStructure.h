//
//  DINStructure.h
//  Dinas
//
//  Created by ziooooo on 17/3/22.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DINFrameAttribute.h"
#import "DINEqualToAttribute.h"
#import "DINMultiplierAttribute.h"
#import "DINOffsetAttribute.h"
#import "DINTargetProtocol.h"
#import "DINBoxValue.h"

@protocol DINStructureDelegate;

@interface DINStructure : NSObject

-(DINStructure * (^)(id<DINTargetProtocol> target))equalTo;

-(DINStructure * (^)())equalToSuperview;

-(DINStructure * (^)(CGFloat multiplier))multiplierBy;

-(void (^)(CGFloat offset))offset;

-(DINStructure *)with;

-(DINStructure *)and;


-(DINStructure *)left;
-(DINStructure *)top;
-(DINStructure *)right;
-(DINStructure *)bottom;
-(DINStructure *)width;
-(DINStructure *)height;
-(DINStructure *)centerX;
-(DINStructure *)centerY;


@property (weak ,nonatomic)id<DINStructureDelegate>delegate;

@end


@protocol DINStructureDelegate <NSObject>

-(DINStructure *)structure:(DINStructure *)structure addStructureWithAttribute:(DINAttribute *)attribute;

@end


#define din_equalTo(value) equalTo(DINMakeBoxValue((value)))


@interface DINStructure (MacroSupport)

-(DINStructure * (^)())din_equalTo;

@end

