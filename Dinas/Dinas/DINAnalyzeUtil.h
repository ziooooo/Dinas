//
//  DINAnalyzeUtil.h
//  Dinas
//
//  Created by ziooooo on 17/3/23.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *const DIN_X_ANALYZE_KEY = @"DIN_X_ANALYZE_KEY";
static NSString *const DIN_Y_ANALYZE_KEY = @"DIN_Y_ANALYZE_KEY";
static NSString *const DIN_W_ANALYZE_KEY = @"DIN_W_ANALYZE_KEY";
static NSString *const DIN_H_ANALYZE_KEY = @"DIN_H_ANALYZE_KEY";

static NSString *const DIN_TOP_KEY      =   @"DIN_TOP_KEY";
static NSString *const DIN_LEFT_KEY     =   @"DIN_LEFT_KEY";
static NSString *const DIN_BOTTOM_KEY   =   @"DIN_BOTTOM_KEY";
static NSString *const DIN_RIGHT_KEY    =   @"DIN_RIGHT_KEY";
static NSString *const DIN_WIDTH_KEY    =   @"DIN_WIDTH_KEY";
static NSString *const DIN_HEIGHT_KEY   =   @"DIN_HEIGHT_KEY";
static NSString *const DIN_CENTERX_KEY  =   @"DIN_CENTERX_KEY";
static NSString *const DIN_CENTERY_KEY  =   @"DIN_CENTERY_KEY";


@interface DINAnalyzeUtil : NSObject

+(NSDictionary *)analyzeWithAttributes:(NSArray *)attributes;

@end
