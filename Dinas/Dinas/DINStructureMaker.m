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
#import "DINTarget.h"

@interface DINStructureMaker()<DINStructureDelegate>

@property (weak ,nonatomic ,readwrite)UIView *view;

@property (strong ,nonatomic)DINStructure *currentStruture;

@property (strong ,nonatomic)NSMutableArray *insTempArray;

@property (strong ,nonatomic)NSMutableArray *insTransfer;

@property (strong ,nonatomic)NSMutableArray *insArray;

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
    //拿到了所有的attr 咋处理？
    //组合为指令
    if ([attribute isKindOfClass:[DINFrameAttribute class]]) {
        
        //如果中转站有指令，转移入库
        if (self.insTransfer.count){
            [self.insArray addObjectsFromArray:self.insTransfer];
            //清空中转站
            [self.insTransfer removeAllObjects];
        }
        //创建新指令加入临时数组
        DINInstruction *instrction = [[DINInstruction alloc] initWithFrameAttr:(DINFrameAttribute *)attribute];
        [self.insTempArray addObject:instrction];
    }
    else{
        
        if (!self.insTransfer.count) {//中转站没内容，从临时数组中取
            for (DINInstruction *ins in self.insTempArray) {
                if ([attribute isKindOfClass:[DINEqualToAttribute class]]) ins.equalToAttr = (DINEqualToAttribute *)attribute.mutableCopy;
                if ([attribute isKindOfClass:[DINMultiplierAttribute class]]) ins.multiplierAttr = (DINMultiplierAttribute *)attribute;
                if ([attribute isKindOfClass:[DINOffsetAttribute class]]) ins.offsetAttr = (DINOffsetAttribute *)attribute;
                
                //加入中转站
                [self.insTransfer addObject:ins];
            }
            //清空临时数据
            [self.insTempArray removeAllObjects];
        }
        else{
            for (DINInstruction *ins in self.insTransfer) {
                if ([attribute isKindOfClass:[DINEqualToAttribute class]]) ins.equalToAttr = (DINEqualToAttribute *)attribute.mutableCopy;
                if ([attribute isKindOfClass:[DINMultiplierAttribute class]]) ins.multiplierAttr = (DINMultiplierAttribute *)attribute;
                if ([attribute isKindOfClass:[DINOffsetAttribute class]]) ins.offsetAttr = (DINOffsetAttribute *)attribute;
            }
        }
    }
    
    
    return structure;
}

#pragma mark - private methods

-(void (^)())build
{
    //将中转站剩余指令转移入库
    [self.insArray addObjectsFromArray:self.insTransfer];
    self.insTransfer = nil;
    self.insTempArray = nil;
    
    //分析 x y w h 所需条件
    NSDictionary *analyzeResult = [DINAnalyzeUtil analyzeWithInstructions:self.insArray];
    
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
    NSDictionary *analyzeResult = [DINAnalyzeUtil analyzeWithInstructions:self.insArray];
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

-(NSMutableArray *)insTempArray
{
    if (!_insTempArray) {
        _insTempArray = [NSMutableArray array];
    }
    return _insTempArray;
}

-(NSMutableArray *)insTransfer
{
    if (!_insTransfer) {
        _insTransfer = [NSMutableArray array];
    }
    return _insTransfer;
}

-(NSMutableArray *)insArray
{
    if (!_insArray) {
        _insArray = [NSMutableArray array];
    }
    return _insArray;
}

@end
