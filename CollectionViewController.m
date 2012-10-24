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
    
    // ページャー
    UIView* pager = [[[UIView alloc] initWithFrame:CGRectMake(0, 300, 320, 30)] autorelease];
    
    UIButton* prevButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    prevButton.frame = CGRectMake(80, 0, 30, 30);
    [prevButton setTitle:@"←" forState:UIControlStateNormal];
    [prevButton addTarget:self action:@selector(pushPrevButton) forControlEvents:UIControlEventTouchUpInside];
    [pager addSubview:prevButton];
    
    pageLabel = [[[UILabel alloc] initWithFrame:CGRectMake(130, 0, 60, 30)] autorelease];
    pageLabel.text = [NSString stringWithFormat:@"%d/16", page+1];
    pageLabel.textAlignment = NSTextAlignmentCenter;
    [pager addSubview:pageLabel];
    
    UIButton* nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextButton.frame = CGRectMake(210, 0, 30, 30);
    [nextButton setTitle:@"→" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(pushNextButton) forControlEvents:UIControlEventTouchUpInside];
    [pager addSubview:nextButton];
    
    [self.view addSubview:pager];
    
    // 戻るボタン
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    backButton.frame = CGRectMake(50, 350, 220, 50);
    [backButton setTitle:@"もどる" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(pushBackButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // 広告ビュー
    UIView* adView = [[[UIView alloc] initWithFrame:CGRectMake(0, 410, 320, 50)] autorelease];
    adView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:adView];
    
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

- (void)pushPrevButton {
    if (page > 0) {
        page--;
    }
    [self reload];
}

- (void)pushNextButton {
    if (page < 15) {
        page++;
    }
    [self reload];
}

-(void)reload {
    pageLabel.text = [NSString stringWithFormat:@"%d/16", page+1];
}

@end
