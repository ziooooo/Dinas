//
//  TestViewController.m
//  Dinas
//
//  Created by ziooooo on 2017/3/30.
//  Copyright © 2017年 ziooooo. All rights reserved.
//

#import "TestViewController.h"
#import "Dinas.h"
@interface TestViewController ()

@end

@implementation TestViewController

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    NSLog(@"dealloc");
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
