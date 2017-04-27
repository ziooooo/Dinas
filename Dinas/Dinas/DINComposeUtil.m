//
//  DINComposeUtil.m
//  Dinas
//
//  Created by ziooooo on 2017/4/26.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINComposeUtil.h"
#import "DINInstruction.h"
#import "DINStructure.h"

@interface DINComposeUtil ()

@property (strong ,nonatomic)DINStructure *currentStructure;

@property (strong ,nonatomic)NSMutableArray *insTransfer;

@property (strong ,nonatomic)NSMutableArray *instructionArr;

@end

@implementation DINComposeUtil

+(instancetype)util
{
    return [[DINComposeUtil alloc] init];
}

-(void)composeInstructionWithStructure:(DINStructure *)structure attribute:(DINAttribute *)attribute
{
    if (!self.currentStructure) self.currentStructure = structure;
    
    if (self.currentStructure == structure) {
        
        if ([attribute isKindOfClass:[DINFrameAttribute class]]) {
            //创建新指令加入临时数组
            DINInstruction *instrction = [[DINInstruction alloc] initWithFrameAttr:(DINFrameAttribute *)attribute];
            [self.insTransfer addObject:instrction];
        }
        
    }
    
    
}


-(NSMutableArray *)instructionArr
{
    if (!_instructionArr) {
        _instructionArr = [NSMutableArray array];
    }
    return _instructionArr;
}

-(NSMutableArray *)insTransfer
{
    if (!_insTransfer) {
        _insTransfer = [NSMutableArray array];
    }
    return _insTransfer;
}

@end
