//
//  Animal.m
//  JuicyTree
//
//  Created by 米澤 翔太 on 12/2/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import "Animal.h"

@implementation Animal

-(id)init
{
    NSLog(@"init");
    self = [super init];
    if (self) {
        //plistから初期化？
        _points = 10;
        
        [self detectInitPatern];
        
        [self animationStart];
    }
    return self;
}

/*
 * 初期化
 */
-(void)detectInitPatern
{
    // アニメーションパターン決定
    _patern = 1 + arc4random()%1;
    NSLog(@"patern : %d", _patern);
    switch (_patern) {
        case 1:
            [self initPatern1];
            break;
            
        default:
            NSLog(@"dont exist patern!!!!!!!!!");
            break;
    }
}

/*
 * 初期化パターン1
 */
-(void)initPatern1
{
    NSLog(@"-> initPatern1");
    UIImage *image = [UIImage imageNamed:@"banana.png"];
    _animatingImageView = [[UIImageView alloc] initWithImage:image];
    [self addSubview:_animatingImageView];
    
    self.frame = CGRectMake(150, 150, image.size.height, image.size.width);
    
    [self animationStart];
}

/*
 * アニメーション開始
 */
-(void)animationStart
{
    switch (_patern) {
        case 1:
            [self adViewLifting];
            break;
            
        default:
            break;
    }
}

/*
 * 広告持ち上げアニメーション
 */
-(void)adViewLifting
{
    NSLog(@"adViewLifting");
    [_delegate adViewLiftup];
    
    //TODO: 持ち上げ中アニメーション
    UIImage *im1 = [UIImage imageNamed:@"banana.png"];
    UIImage *im2 = [UIImage imageNamed:@"budo.png"];
    UIImage *im3 = [UIImage imageNamed:@"cola.png"];
    NSArray *ims = [NSArray arrayWithObjects:im1, im2, im3, nil];
    _animatingImageView.animationImages = ims;
    _animatingImageView.animationDuration = 1.5;
    _animatingImageView.animationRepeatCount = 0;
    [_animatingImageView startAnimating];
    
    // 持ち上げアニメーション待ち
    CGContextRef context = UIGraphicsGetCurrentContext();
    [UIView beginAnimations:@"AnimalAnimation" context:context];
    [UIView setAnimationDuration:3];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(huladance)];
}

/*
 * 腰振りアニメーション
 */
-(void)huladance
{
    UIImage *im4 = [UIImage imageNamed:@"carrot.png"];
    UIImage *im5 = [UIImage imageNamed:@"endomame.png"];
    UIImage *im6 = [UIImage imageNamed:@"curry.png"];
    NSArray *ims2 = [NSArray arrayWithObjects:im4, im5, im6, nil];
    _animatingImageView.animationImages = ims2;
    _animatingImageView.animationDuration = 1.5;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        LOG_CURRENT_METHOD;
        self.userInteractionEnabled = YES;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //TODO: アニメーション
    
    [_delegate gainPoint];
}


-(void)dealloc
{
    [super dealloc];
    
    [_animatingImageView release];
    [_pointLabel release];
}


@end
