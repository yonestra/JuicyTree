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

//-(id)init
//{
//    self = [super init];
//    if (self) {
//        
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    fruitsArray = [[NSMutableArray alloc] init];
    
    backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"tree_lv1.png"]];
    backgroundImageView.frame = self.view.frame;
    [self.view addSubview:backgroundImageView];
    
    // コレクションビューを表示するボタン
    UIButton* goCollectionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    goCollectionButton.frame = CGRectMake(260, 10, 50, 50);
    [goCollectionButton addTarget:self
                           action:@selector(pushCollectionButton)
                 forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:goCollectionButton];
    
    // make gamemanager
    gameManager = [GameManager sharedGameManager];
    
    // ゲージ枠
    UIView* gaugeFrameView = [[[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50-35, self.view.frame.size.width, 35)] autorelease];
    gaugeFrameView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gauge_frame.png"]];
    [self.view addSubview:gaugeFrameView];
    
    // ゲージの背景（白色透過）
    UIView* gaugeBackgroundView = [[[UIView alloc] initWithFrame:gaugeFrameView.frame] autorelease];
    gaugeBackgroundView.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.7];
    [self.view insertSubview:gaugeBackgroundView belowSubview:gaugeFrameView];
    
    // ゲージ本体
    gaugeBodyView = [[[UIView alloc] initWithFrame:gaugeFrameView.frame] autorelease];
    CGRect frame = CGRectMake(gaugeBodyView.frame.origin.x, gaugeBodyView.frame.origin.y, 0, gaugeBodyView.frame.size.height);
    gaugeBodyView.frame = frame;
    gaugeBodyView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gauge.png"]];
    [self.view insertSubview:gaugeBodyView belowSubview:gaugeFrameView];
    
    // 広告表示枠
    UIView* adView = [[[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)] autorelease];
    adView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:adView];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(getFruits:) name:NOTIFICATION_CREATE_FRUIT object:nil];
    [notificationCenter addObserver:self selector:@selector(pointUp:) name:NOTIFICATION_POINT_UP object:nil];
    [notificationCenter addObserver:self selector:@selector(levelUpTree:) name:NOTIFICATION_LELEL_UP_TREE object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [backgroundImageView release], backgroundImageView = nil;
    [fruitsArray release], fruitsArray = nil;
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
        [fruitsArray addObject:fruitImageView];
    }
}

// ポイントアップ!
- (void)pointUp:(NSNotificationCenter*)center {
    NSInteger point = [[[center userInfo] objectForKey:@"point"] intValue];
    
    // animationでゲージを増やす
    [self growGaugeWithAnimatiion:point];
}

// 木がレベルアップ!
- (void)levelUpTree:(NSNotificationCenter*)center {
    LOG_CURRENT_METHOD;
    NSNumber* treeLevelNum = [[center userInfo] objectForKey:@"treeLevel"];
    NSInteger treeLevel = [treeLevelNum intValue];
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Level Up!"
                                                    message:@"木レベルがあがりました！おめでとう！"
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
    [alert release];
    
    if (backgroundImageView != nil) {
        [backgroundImageView removeFromSuperview];
        [backgroundImageView release], backgroundImageView = nil;
    }
    
    // 適した壁紙をセット
    NSString* fileName = [NSString stringWithFormat:@"tree_lv%d.png", treeLevel];
    backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:fileName]];
    backgroundImageView.frame = self.view.frame;
    [self.view insertSubview:backgroundImageView atIndex:0];
    [backgroundImageView release];
    
    // ゲージをスタート位置
    gaugeBodyView.frame = CGRectMake(gaugeBodyView.frame.origin.x, gaugeBodyView.frame.origin.y,
                                     0, gaugeBodyView.frame.size.height);
    
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


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    CGPoint point = [[touches anyObject] locationInView:self.view];
    for (FruitOnTreeImageView* fruitImage in [fruitsArray reverseObjectEnumerator]) {
        if (CGRectContainsPoint(fruitImage.frame, point) == 1) {
            [fruitsArray removeObject:fruitImage];
            [fruitImage crop];
        }
    }
}

- (void)growGaugeWithAnimatiion:(NSInteger)point {
    LOG_CURRENT_METHOD;
    int maxPoint = [[GameManager sharedGameManager] pointToNextLevel];
    
    float width = point/(float)maxPoint;
    LOG(@"point, maxPoint, width = %d, %d, %f", point, maxPoint, width);
    
    [UIView animateWithDuration:0.5f
                     animations:^{
                         gaugeBodyView.frame = CGRectMake(0,
                                                          gaugeBodyView.frame.origin.y,
                                                          width*320,
                                                          gaugeBodyView.frame.size.height);
                     }
                     completion:^(BOOL finished){
                         [[GameManager sharedGameManager] judgeLevelUpTree:point];
                     }];
}


@end
