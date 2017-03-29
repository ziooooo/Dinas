//
//  DINTargetProtocol.h
//  Dinas
//
//  Created by ziooooo on 17/3/27.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DINTarget;

@protocol DINTargetProtocol <NSObject>

-(DINTarget *)createTarget;

@end
