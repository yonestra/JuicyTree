//
//  ViewController.m
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/16/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
#import "CollectionViewController.h"
#import "FruitOnTreeImageView.h"

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
    
    // コレクションビューを表示するボタン
    UIButton* goCollectionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goCollectionButton.frame = CGRectMake(260, 10, 50, 50);
    [goCollectionButton addTarget:self
                           action:@selector(pushCollectionButton)
                 forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goCollectionButton];
    
    // make gamemanager
    gameManager = [GameManager sharedGameManager];
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
//    NSInteger fruidId = [gameManager createFruitId];
//    LOG(@"fruitId = %d", fruidId);
    
    //    NSMutableDictionary *pos_x = [NSMutableDictionary dictionaryWithObjectsAndKeys:
    //                                  POS_1_X, 1,
    //                                  POS_2_X, 2,
    //                                  POS_3_X, 3,
    //                                  nil
    //                                  ];
    //    NSMutableDictionary *pos_y = [NSMutableDictionary dictionaryWithObjectsAndKeys:
    //                                  POS_1_Y, 1,
    //                                  POS_2_Y, 2,
    //                                  POS_3_Y, 3,
    //                                  nil
    //                                  ];
    
    
    
    FruitOnTreeImageView *fruit_1 = [[[FruitOnTreeImageView alloc] initWithFrame:CGRectMake(POS_1_X, POS_1_Y, 50, 50)] autorelease];
    fruit_1.image = [UIImage imageNamed:@"banana.jpeg"];
    fruit_1.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture_1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    //    [fruit_1 addGestureRecognizer:panGesture_1];
    [panGesture_1 release];
    [self.view addSubview:fruit_1];
    
    FruitOnTreeImageView *fruit_2 = [[[FruitOnTreeImageView alloc] initWithFrame:CGRectMake(POS_2_X, POS_2_Y, 50, 50)] autorelease];
    fruit_2.image = [UIImage imageNamed:@"banana.jpeg"];
    fruit_2.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture_2 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    //    [fruit_2 addGestureRecognizer:panGesture_2];
    [panGesture_2 release];
    [self.view addSubview:fruit_2];
    
    FruitOnTreeImageView *fruit_3 = [[[FruitOnTreeImageView alloc] initWithFrame:CGRectMake(POS_3_X, POS_3_Y, 50, 50)] autorelease];
    fruit_3.image = [UIImage imageNamed:@"banana.jpeg"];
    fruit_3.userInteractionEnabled = YES;
    UIPanGestureRecognizer *panGesture_3 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    //    [fruit_3 addGestureRecognizer:panGesture_3];
    [panGesture_3 release];
    [self.view addSubview:fruit_3];
    
    
}

- (void)handlePanGesture:(id)sender {
    UIPanGestureRecognizer *pan = (UIPanGestureRecognizer*)sender;
    UIImageView *imageView = (UIImageView *)pan.view;
    imageView.hidden = YES;
    
    //    UIImageView *imageView = [self.view viewWithTag:dd]
    //    CGPoint point = [pan translationInView:self.view];
    //    CGPoint velocity = [pan velocityInView:self.view];
    //    NSLog(@"pan. translation: %@, velocity: %@", NSStringFromCGPoint(point), NSStringFromCGPoint(velocity));
}

- (void)pushCollectionButton {
    LOG_CURRENT_METHOD;
    
    // コレクションビューに遷移
    CATransition *animation = [CATransition animation];
    [animation setType:kCATransitionFade];
    [animation setDuration:0.3];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [animation setDelegate:self];
    
    CollectionViewController* collectionVC = [[CollectionViewController alloc] init];
    
    [[self.navigationController.view layer] addAnimation:animation forKey:nil];
    [self.navigationController pushViewController:collectionVC animated:NO];
    [collectionVC release];
}

@end
