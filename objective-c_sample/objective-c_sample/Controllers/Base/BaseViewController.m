//
//  BaseViewController.m
//  objective-c_sample
//
//  Created by Miura Kentaro on 2017/04/22.
//  Copyright © 2017年 Miura Kentaro. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Navigation
    self.navigationController.navigationBar.backgroundColor = [UIColor blueColor];
    
    // BackGround
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
