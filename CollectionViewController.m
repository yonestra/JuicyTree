//
//  CollectionViewController.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CollectionViewController.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// interface builderを使わない場合はこのメソッドが必要
- (void)loadView{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view release];
    
    // 戻るボタン
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(0, 0, 100, 50);
    [backButton setTitle:@"もどる" forState:UIControlStateNormal];
    backButton.center = self.view.center;
    [backButton addTarget:self action:@selector(pushBackButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // コレクションImageView
    int i=0, j=0;
    UIImage* image = [UIImage imageNamed:@"apple.jpeg"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(50+(50+35)*i, 100+(50+35)*j, 50, 50);
    [self.view addSubview:imageView];
    
    i++;
    image = [UIImage imageNamed:@"banana.jpeg"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(50+(50+35)*i, 100+(50+35)*j, 50, 50);
    [self.view addSubview:imageView];
    
    i++;
    image = [UIImage imageNamed:@"apple.jpeg"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(50+(50+35)*i, 100+(50+35)*j, 50, 50);
    [self.view addSubview:imageView];
    
    j++;
    i=0;
    image = [UIImage imageNamed:@"apple.jpeg"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(50+(50+35)*i, 150+(50+35)*j, 50, 50);
    [self.view addSubview:imageView];
    
    i++;
    image = [UIImage imageNamed:@"apple.jpeg"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(50+(50+35)*i, 150+(50+35)*j, 50, 50);
    [self.view addSubview:imageView];
    
    i++;
    image = [UIImage imageNamed:@"apple.jpeg"];
    imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(50+(50+35)*i, 150+(50+35)*j, 50, 50);
    [self.view addSubview:imageView];    
}

- (void)pushBackButton {
    LOG_CURRENT_METHOD;
    
    CATransition *animation = [CATransition animation];
    [animation setType:kCATransitionFade];
    [animation setDuration:0.3];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [animation setDelegate:self];
    
    [[self.navigationController.view layer] addAnimation:animation forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
@end
