//
//  ViewController.m
//  IRTimeZoneDemo
//
//  Created by Hijazi on 16/4/15.
//  Copyright (c) 2015 iReka Soft. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    IRTimeZoneController *timeZoneController = [[IRTimeZoneController alloc] init];
    [self presentViewController:timeZoneController animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
