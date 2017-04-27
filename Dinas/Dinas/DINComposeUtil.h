//
//  DINComposeUtil.h
//  Dinas
//
//  Created by ziooooo on 2017/4/26.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DINStructure ,DINAttribute;

@interface DINComposeUtil : NSObject

+(instancetype)util;

-(void)composeInstructionWithStructure:(DINStructure *)structure attribute:(DINAttribute *)attribute;

@end
