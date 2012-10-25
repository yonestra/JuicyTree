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
    
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tree_lv4.png"]];
    backgroundImageView.frame = self.view.frame;
    [self.view addSubview:backgroundImageView];
    [backgroundImageView release];
    
    // コレクションビューを表示するボタン
    UIButton* goCollectionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goCollectionButton.frame = CGRectMake(260, 10, 50, 50);
    [goCollectionButton addTarget:self
                           action:@selector(pushCollectionButton)
                 forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goCollectionButton];
    
    // make gamemanager
    gameManager = [GameManager sharedGameManager];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(getFruits:) name:NOTIFICATION_CREATE_FRUIT object:nil];
    [notificationCenter addObserver:self selector:@selector(lebvelUpTree:) name:NOTIFICATION_CREATE_FRUIT object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
}

- (void)getFruits:(NSNotificationCenter*)center
{
    
    NSArray *fruits = [[center userInfo] objectForKey:@"fruitsArray"];
    for (Fruits *fruit in fruits) {
        FruitOnTreeImageView *fruitImageView = [[[FruitOnTreeImageView alloc] init] autorelease];
        fruitImageView.frame = [GameManager positionId2Rect:fruit.positionId];
        fruitImageView.image = [UIImage imageNamed:fruit.imageName];
        fruitImageView.fruit = fruit;
        //        UIPanGestureRecognizer *panGesture_1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        //    [fruit_1 addGestureRecognizer:panGesture_1];
        //        [panGesture_1 release];
         CGAffineTransform scale = CGAffineTransformMakeScale(0.0, 0.0);
        [fruitImageView setTransform:scale];
        [self.view addSubview:fruitImageView];
        [fruitImageView bornAmination];
    }
    
}

- (void)levelUpTree:(NSNotificationCenter*)center {
    
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    LOG(@"touch (x,y) = %f, %f", point.x, point.y);
}

@end
