//
//  ViewController.m
//  Dinas
//
//  Created by ziooooo on 17/3/21.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "ViewController.h"
#import "Dinas.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    [view1 din_makeStructures:^(DINStructureMaker *make) {
        make.left.top.equalTo(self.view).offset(60);
        make.size.din_equalTo(CGSizeMake(200, 200));
        make.build();
    }];
    

    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:view2];
    [view2 din_makeStructures:^(DINStructureMaker *make) {
        make.size.din_equalTo(CGSizeMake(50, 70));
        make.center.equalTo(self.view);
        make.build();
    }];

    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor blueColor];
    [view1 addSubview:view3];
    [view3 din_makeStructures:^(DINStructureMaker *make) {
        make.right.equalToSuperview();
        make.top.equalTo(view1.din_Bottom).offset(10);
        make.left.equalTo(view2.din_CenterX);
        make.height.din_equalTo(70);
        make.build();
        
    }];
}



@end
