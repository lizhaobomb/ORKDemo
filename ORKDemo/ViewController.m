//
//  ViewController.m
//  ORKDemo
//
//  Created by lizhao on 15/4/28.
//  Copyright (c) 2015年 lizhao. All rights reserved.
//

#import "ViewController.h"
#import <ResearchKit/ResearchKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    ORKInstructionStep *myStep =
    [[ORKInstructionStep alloc] initWithIdentifier:@"intro"];
    myStep.title = @"Welcome to ResearchKit";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
