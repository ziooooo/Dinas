//
//  DINAnalyzeUtil.m
//  Dinas
//
//  Created by ziooooo on 17/3/23.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINAnalyzeUtil.h"
#import "DINInstruction.h"

@implementation DINAnalyzeUtil

+(NSDictionary *)analyzeWithInstructions:(NSArray *)instructions
{
    NSMutableArray *insXArr = [NSMutableArray array];
    NSMutableArray *insYArr = [NSMutableArray array];
    NSMutableArray *insWArr = [NSMutableArray array];
    NSMutableArray *insHArr = [NSMutableArray array];
    
    [instructions enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull ins, NSUInteger idx, BOOL * _Nonnull stop) {
        
        switch (ins.attrType) {
            case kDINFrameAttributeTypeLeft:
            case kDINFrameAttributeTypeRight:
            case kDINFrameAttributeTypeWidth:
            case kDINFrameAttributeTypeCenterX:{
                [insXArr addObject:ins];
                [insWArr addObject:ins];
            }
                break;
            case kDINFrameAttributeTypeTop:
            case kDINFrameAttributeTypeBottom:
            case kDINFrameAttributeTypeHeight:
            case kDINFrameAttributeTypeCenterY:{
                [insYArr addObject:ins];
                [insHArr addObject:ins];
            }
                break;
            default:
                break;
        }
    }];
    
    
    NSMutableDictionary *insXDic = [NSMutableDictionary dictionary];
    NSMutableDictionary *insYDic = [NSMutableDictionary dictionary];
    NSMutableDictionary *insWDic = [NSMutableDictionary dictionary];
    NSMutableDictionary *insHDic = [NSMutableDictionary dictionary];
    
    //X
    [insXArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull ins, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (ins.attrType) {
            case kDINFrameAttributeTypeLeft:{
                insXDic[DIN_LEFT_KEY] = ins;
                *stop = YES;
            }
                break;
            case kDINFrameAttributeTypeWidth:{
                [insXArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull subIns, NSUInteger idx, BOOL * _Nonnull subStop) {
                    if (subIns.attrType == kDINFrameAttributeTypeCenterX || subIns.attrType == kDINFrameAttributeTypeRight) {
                        insXDic[DIN_WIDTH_KEY] = ins;
                        insXDic[subIns.attrType == kDINFrameAttributeTypeCenterX?DIN_CENTERX_KEY:DIN_RIGHT_KEY] = subIns;
                        *subStop = YES;
                        *stop = YES;
                    }
                }];
            }
                break;
            case kDINFrameAttributeTypeRight:{
                [insXArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull subIns, NSUInteger idx, BOOL * _Nonnull subStop) {
                    if (subIns.attrType == kDINFrameAttributeTypeCenterX || subIns.attrType == kDINFrameAttributeTypeWidth) {
                        insXDic[DIN_RIGHT_KEY] = ins;
                        insXDic[subIns.attrType == kDINFrameAttributeTypeCenterX?DIN_CENTERX_KEY:DIN_WIDTH_KEY] = subIns;
                        *subStop = YES;
                        *stop = YES;
                    }
                }];
            }
                break;

            default:
                break;
        }
    }];
    
    //Y
    [insYArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull ins, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (ins.attrType) {
            case kDINFrameAttributeTypeTop:{
                insYDic[DIN_TOP_KEY] = ins;
                *stop = YES;
            }
                break;
            case kDINFrameAttributeTypeHeight:{
                [insYArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull subIns, NSUInteger idx, BOOL * _Nonnull subStop) {
                    if (subIns.attrType == kDINFrameAttributeTypeCenterY || subIns.attrType == kDINFrameAttributeTypeBottom) {
                        insYDic[DIN_HEIGHT_KEY] = ins;
                        insYDic[subIns.attrType == kDINFrameAttributeTypeCenterY?DIN_CENTERY_KEY:DIN_BOTTOM_KEY] = subIns;
                        *subStop = YES;
                        *stop = YES;
                    }
                }];
            }
                break;
            case kDINFrameAttributeTypeBottom:{
                [insYArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull subIns, NSUInteger idx, BOOL * _Nonnull subStop) {
                    if (subIns.attrType == kDINFrameAttributeTypeCenterY || subIns.attrType == kDINFrameAttributeTypeHeight) {
                        insYDic[DIN_HEIGHT_KEY] = ins;
                        insYDic[subIns.attrType == kDINFrameAttributeTypeCenterY?DIN_CENTERY_KEY:DIN_HEIGHT_KEY] = subIns;
                        *subStop = YES;
                        *stop = YES;
                    }
                }];
            }
                break;
                
            default:
                break;
        }
    }];
    
    //W
    [insWArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull ins, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (ins.attrType) {
            case kDINFrameAttributeTypeWidth:{
                insWDic[DIN_WIDTH_KEY] = ins;
                *stop = YES;
            }
                break;
            case kDINFrameAttributeTypeLeft:{
                [insWArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull subIns, NSUInteger idx, BOOL * _Nonnull subStop) {
                    if (subIns.attrType == kDINFrameAttributeTypeCenterX || subIns.attrType == kDINFrameAttributeTypeRight) {
                        insWDic[DIN_LEFT_KEY] = ins;
                        insWDic[subIns.attrType == kDINFrameAttributeTypeCenterX?DIN_CENTERX_KEY:DIN_RIGHT_KEY] = subIns;
                        *subStop = YES;
                        *stop = YES;
                    }
                }];
            }
                break;
            case kDINFrameAttributeTypeRight:{
                [insWArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull subIns, NSUInteger idx, BOOL * _Nonnull subStop) {
                    if (subIns.attrType == kDINFrameAttributeTypeCenterX || subIns.attrType == kDINFrameAttributeTypeLeft) {
                        insWDic[DIN_RIGHT_KEY] = ins;
                        insWDic[subIns.attrType == kDINFrameAttributeTypeCenterX?DIN_CENTERX_KEY:DIN_LEFT_KEY] = subIns;
                        *subStop = YES;
                        *stop = YES;
                    }
                }];
            }
                break;
            default:
                break;
        }
        
    }];
    
    //H
    [insHArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull ins, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (ins.attrType) {
            case kDINFrameAttributeTypeHeight:{
                insHDic[DIN_HEIGHT_KEY] = ins;
                *stop = YES;
            }
                break;
            case kDINFrameAttributeTypeTop:{
                [insHArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull subIns, NSUInteger idx, BOOL * _Nonnull subStop) {
                    if (subIns.attrType == kDINFrameAttributeTypeCenterY || subIns.attrType == kDINFrameAttributeTypeBottom) {
                        insHDic[DIN_TOP_KEY] = ins;
                        insHDic[subIns.attrType == kDINFrameAttributeTypeCenterY?DIN_CENTERY_KEY:DIN_BOTTOM_KEY] = subIns;
                        *subStop = YES;
                        *stop = YES;
                    }
                }];
            }
                break;
            case kDINFrameAttributeTypeBottom:{
                [insHArr enumerateObjectsUsingBlock:^(DINInstruction *  _Nonnull subIns, NSUInteger idx, BOOL * _Nonnull subStop) {
                    if (subIns.attrType == kDINFrameAttributeTypeCenterY || subIns.attrType == kDINFrameAttributeTypeTop) {
                        insHDic[DIN_BOTTOM_KEY] = ins;
                        insHDic[subIns.attrType == kDINFrameAttributeTypeCenterY?DIN_CENTERY_KEY:DIN_TOP_KEY] = subIns;
                        *subStop = YES;
                        *stop = YES;
                    }
                }];
            }
                break;
            default:
                break;
        }
        
    }];
    
    NSDictionary *resultDic = @{
                                DIN_X_ANALYZE_KEY:insXDic,
                                DIN_Y_ANALYZE_KEY:insYDic,
                                DIN_W_ANALYZE_KEY:insWDic,
                                DIN_H_ANALYZE_KEY:insHDic
                                };
    
    return resultDic;
}

@end
