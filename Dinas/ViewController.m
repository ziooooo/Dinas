//
//  ViewController.m
//  Dinas
//
//  Created by ziooooo on 17/3/21.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "ViewController.h"
#import "Dinas.h"

#define CCColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *bodyColor = CCColor(200, 123, 64, 1);
    
    UIView *head = [[UIView alloc] init];
    head.backgroundColor = bodyColor;
    [self.view addSubview:head];
    [head din_makeStructures:^(DINStructureMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalToSuperview().offset(100);
        make.size.din_equalTo(CGSizeMake(200, 200));
        make.build();
    }];
    
    UIView *leftEar = [[UIView alloc] init];
    leftEar.backgroundColor = bodyColor;
    [self.view addSubview:leftEar];
    [leftEar din_makeStructures:^(DINStructureMaker *make) {
        make.width.equalTo(head.din_Width).multiplierBy(0.3);
        make.height.din_equalTo(30);
        make.bottom.equalTo(head.din_Top);
        make.left.equalTo(head).offset(10);
        make.build();
    }];
    
    UIView *rightEar = [[UIView alloc] init];
    rightEar.backgroundColor = bodyColor;
    [self.view addSubview:rightEar];
    [rightEar din_makeStructures:^(DINStructureMaker *make) {
        make.size.bottom.equalTo(leftEar);
        make.right.equalTo(head).offset(-10);
        make.build();
    }];
    
    UIView *leftEye = [[UIView alloc] init];
    leftEye.backgroundColor = [UIColor blackColor];
    [head addSubview:leftEye];
    [leftEye din_makeStructures:^(DINStructureMaker *make) {
        make.size.din_equalTo(20);
        make.top.equalToSuperview().offset(50);
        make.centerX.equalToSuperview().offset(-50);
        make.build();
    }];
    
    UIView *rightEye = [[UIView alloc] init];
    rightEye.backgroundColor = [UIColor blackColor];
    [head addSubview:rightEye];
    [rightEye din_makeStructures:^(DINStructureMaker *make) {
        make.size.centerY.equalTo(leftEye);
        make.centerX.equalToSuperview().offset(50);
        make.build();
    }];
    
    UIView *nose = [[UIView alloc] init];
    nose.backgroundColor = CCColor(238, 176, 0, 1);
    [head addSubview:nose];
    [nose din_makeStructures:^(DINStructureMaker *make) {
        make.centerX.equalToSuperview();
        make.size.din_equalTo(80);
        make.bottom.equalToSuperview().offset(-20);
        make.build();
    }];
    
    UIView *nasalTip = [[UIView alloc] init];
    nasalTip.backgroundColor = [UIColor blackColor];
    [nose addSubview:nasalTip];
    [nasalTip din_makeStructures:^(DINStructureMaker *make) {
        make.centerX.equalTo(head);
        make.size.din_equalTo(15);
        make.centerY.equalToSuperview().offset(-20);
        make.build();
    }];
    
    UILabel *descriptionLabel = [[UILabel alloc]init];
    descriptionLabel.text = @"Like a bear?";
    descriptionLabel.font = [UIFont systemFontOfSize:23];
    descriptionLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:descriptionLabel];
    [descriptionLabel din_makeStructures:^(DINStructureMaker *make) {
        make.centerX.equalToSuperview();
        make.top.equalTo(head.din_Bottom).offset(30);
        make.width.equalToSuperview();
        make.height.din_equalTo(25);
        make.build();
    }];
    
    
    
}



@end
