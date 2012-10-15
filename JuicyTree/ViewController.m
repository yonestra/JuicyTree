//
//  ViewController.m
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/16/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    call_btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    call_btn.frame = CGRectMake(0, 0, 50, 30);
    [self.view addSubview:call_btn];
    call_btn.center = self.view.center;
    
    [call_btn addTarget:self action:@selector(getFruits:)
       forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [call_btn release];
    
    [super dealloc];
}

- (void)getFruits:(UIButton*)sender
{
    LOG(@"hey!");
}

@end
