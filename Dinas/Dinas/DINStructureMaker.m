//
//  DINStructureMaker.m
//  Dinas
//
//  Created by ziooooo on 17/3/21.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "DINStructureMaker.h"
#import "DINInstruction.h"
#import "DINAnalyzeUtil.h"

@interface DINStructureMaker()<DINStructureDelegate>

@property (weak ,nonatomic ,readwrite)UIView *view;

@property (strong ,nonatomic)DINStructure *currentStruture;

@property (strong ,nonatomic)NSMutableArray *attributeArray;

@end

@implementation DINStructureMaker

-(instancetype)initWithView:(UIView *)view
{
    if (self = [super init]) {
        NSAssert(view.superview, @"must has superView");
        self.view = view;
        
    }
    return self;
}

#pragma mark - delegate methods

-(DINStructure *)structure:(DINStructure *)structure addStructureWithAttribute:(DINAttribute *)attribute
{
    
    //保存所有的attr build时处理
    [self.attributeArray addObject:attribute];
    
    return structure;
}

#pragma mark - private methods

-(void (^)())build
{

    //分析 x y w h 所需条件
    NSDictionary *analyzeResult = [DINAnalyzeUtil analyzeWithAttributes:self.attributeArray];

    //分别设置 x y w h
    
    CGRect originalFrame = self.view.frame;
    CGFloat x = originalFrame.origin.x;
    CGFloat y = originalFrame.origin.y;
    CGFloat w = originalFrame.size.width;
    CGFloat h = originalFrame.size.height;
    
    //X
    NSDictionary *insXDic = analyzeResult[DIN_X_ANALYZE_KEY];
    if (insXDic.count) {
        
        DINInstruction *insLeft = insXDic[DIN_LEFT_KEY];
        DINInstruction *insCenterX = insXDic[DIN_CENTERX_KEY];
        DINInstruction *insWidth = insXDic[DIN_WIDTH_KEY];
        DINInstruction *insRight = insXDic[DIN_RIGHT_KEY];
        
        if (insLeft) {
            x = [insLeft executeWithRelativeView:self.view];
        }
        else if (insRight && insWidth){
            //right
            CGFloat right = [insRight executeWithRelativeView:self.view];
            //width
            CGFloat width = [insWidth executeWithRelativeView:self.view];
            
            x = right - width;

        }
        else if (insCenterX && insWidth){
            //centerX
            CGFloat centerX = [insCenterX executeWithRelativeView:self.view];
            //width
            CGFloat width = [insWidth executeWithRelativeView:self.view];
            
            x = centerX - width / 2;
        }
        else if (insCenterX && insRight){
            //centerX
            CGFloat centerX = [insCenterX executeWithRelativeView:self.view];
            //right
            CGFloat right = [insRight executeWithRelativeView:self.view];
            
            x = centerX - (right - centerX);
        }

    }
    
    //Y
    NSDictionary *insYDic = analyzeResult[DIN_Y_ANALYZE_KEY];
    if (insYDic.count) {
        
        DINInstruction *insTop = insYDic[DIN_TOP_KEY];
        DINInstruction *insBottom = insYDic[DIN_BOTTOM_KEY];
        DINInstruction *insHeight = insYDic[DIN_HEIGHT_KEY];
        DINInstruction *insCenterY = insYDic[DIN_CENTERY_KEY];
        
        if (insTop) {
            y = [insTop executeWithRelativeView:self.view];
        }
        else if (insBottom && insHeight){
            CGFloat bottom = [insBottom executeWithRelativeView:self.view];
            CGFloat height = [insHeight executeWithRelativeView:self.view];
            y = bottom - height;
        }
        else if (insCenterY && insHeight){
            CGFloat centerY = [insCenterY executeWithRelativeView:self.view];
            CGFloat height = [insHeight executeWithRelativeView:self.view];
            y = centerY - height / 2;
        }
        else if (insCenterY && insBottom){
            CGFloat bottom = [insBottom executeWithRelativeView:self.view];
            CGFloat centerY = [insCenterY executeWithRelativeView:self.view];
            y = centerY - (bottom - centerY);
        }
    }
    
    //W
    NSDictionary *insWDic = analyzeResult[DIN_W_ANALYZE_KEY];
    if (insWDic.count) {
        
        DINInstruction *insWidth = insWDic[DIN_WIDTH_KEY];
        DINInstruction *insLeft = insWDic[DIN_LEFT_KEY];
        DINInstruction *insRight = insWDic[DIN_RIGHT_KEY];
        DINInstruction *insCenterX = insWDic[DIN_CENTERX_KEY];
        
        if (insWidth) {
            w = [insWidth executeWithRelativeView:self.view];
        }
        else if (insLeft && insRight){
            CGFloat left = [insLeft executeWithRelativeView:self.view];
            CGFloat right = [insRight executeWithRelativeView:self.view];
            w = right - left;
        }
        else if (insLeft && insCenterX){
            CGFloat centerX = [insCenterX executeWithRelativeView:self.view];
            CGFloat left = [insLeft executeWithRelativeView:self.view];
            w = (centerX - left) * 2;
        }
        else if (insRight && insCenterX){
            CGFloat centerX = [insCenterX executeWithRelativeView:self.view];
            CGFloat right = [insRight executeWithRelativeView:self.view];
            w = (right - centerX) * 2;
        }
    }
    
    //H
    NSDictionary *insHDic = analyzeResult[DIN_H_ANALYZE_KEY];
    if (insHDic.count) {
        
        DINInstruction *insHeight = insHDic[DIN_HEIGHT_KEY];
        DINInstruction *insTop = insHDic[DIN_TOP_KEY];
        DINInstruction *insBottom = insHDic[DIN_BOTTOM_KEY];
        DINInstruction *insCenterY = insHDic[DIN_CENTERY_KEY];
        
        if (insHeight) {
            h = [insHeight executeWithRelativeView:self.view];
        }
        else if (insTop && insBottom){
            CGFloat top = [insTop executeWithRelativeView:self.view];
            CGFloat bottom = [insBottom executeWithRelativeView:self.view];
            h = bottom - top;
        }
        else if (insTop && insCenterY){
            CGFloat centerY = [insCenterY executeWithRelativeView:self.view];
            CGFloat top = [insTop executeWithRelativeView:self.view];
            h = (centerY - top) * 2;
        }
        else if (insBottom && insCenterY){
            CGFloat centerY = [insCenterY executeWithRelativeView:self.view];
            CGFloat bottom = [insBottom executeWithRelativeView:self.view];
            h = (bottom - centerY) * 2;
        }
    }
    
    CGRect finalFrame = CGRectMake(x, y, w, h);
    
    self.view.frame = finalFrame;
    
    return ^(){};
}

-(void (^)())debug
{
    NSDictionary *analyzeResult = [DINAnalyzeUtil analyzeWithAttributes:self.attributeArray];
    if (![analyzeResult[DIN_X_ANALYZE_KEY] count]) {
        NSLog(@"X Not Sure");
    }
    if (![analyzeResult[DIN_Y_ANALYZE_KEY] count]) {
        NSLog(@"Y Not Sure");
    }
    if (![analyzeResult[DIN_W_ANALYZE_KEY] count]) {
        NSLog(@"W Not Sure");
    }
    if (![analyzeResult[DIN_H_ANALYZE_KEY] count]) {
        NSLog(@"H Not Sure");
    }
    return ^(){};
}

#pragma mark - getters and setters

#define DIN_ATTR_FORWARD(attr)          \
-(DINStructure *)attr {                 \
    return self.currentStruture.attr;   \
}                                       \

DIN_ATTR_FORWARD(top)
DIN_ATTR_FORWARD(right)
DIN_ATTR_FORWARD(bottom)
DIN_ATTR_FORWARD(left)
DIN_ATTR_FORWARD(width)
DIN_ATTR_FORWARD(height)
DIN_ATTR_FORWARD(centerX)
DIN_ATTR_FORWARD(centerY)


-(DINStructure *)size
{
    return self.width.height;
}
-(DINStructure *)center
{
    return self.centerX.centerY;
}
-(DINStructure *)edge
{
    return self.top.left.bottom.right;
}


#pragma mark - lazy load

-(DINStructure *)currentStruture
{
    if (!_currentStruture) {
        _currentStruture = [[DINStructure alloc] init];
        _currentStruture.delegate = self;
    }
    return _currentStruture;
}

-(NSMutableArray *)attributeArray
{
    if (!_attributeArray) {
        _attributeArray = [NSMutableArray array];
    }
    return _attributeArray;
}

@end
