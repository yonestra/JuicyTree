//
//  FruitOnTreeImageView.m
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/17/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import "FruitOnTreeImageView.h"
#import "GameManager.h"

@implementation FruitOnTreeImageView

@synthesize fruit;

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


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)crop
{
    LOG_CURRENT_METHOD;
    GameManager *gm = [GameManager sharedGameManager];
    LOG(@"fuirt = %@", self.fruit);
    
    // アニメーション
    [UIView animateWithDuration:SHAKE_DURATION / 2
                          delay:0.0f
     //                        options:UIViewAnimationOptionCurveLinear
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^
     {
         //         [UIView setAnimationRepeatCount:2.0f];
         self.transform = CGAffineTransformRotate(self.transform, SHAKE_ROTATE / 2);
         
     } completion:^(BOOL finished) {
         [UIView animateWithDuration:SHAKE_DURATION
                               delay:0.0f
                             options:UIViewAnimationOptionCurveEaseOut
                          animations:^
          {
              self.transform = CGAffineTransformRotate(self.transform, - SHAKE_ROTATE);
              
          } completion:^(BOOL finished) {
              [UIView animateWithDuration:SHAKE_DURATION
                                    delay:0.0f
                                  options:UIViewAnimationOptionCurveEaseOut
                               animations:^
               {
                   self.transform = CGAffineTransformRotate(self.transform, SHAKE_ROTATE);
                   
               } completion:^(BOOL finished) {
                   [UIView animateWithDuration:1.0f / 2.5f
                                         delay:0
                    //                             options:UIViewAnimationOptionOverrideInheritedDuration
                                       options:UIViewAnimationOptionCurveEaseOut
                                    animations:^
                    {
                        CGAffineTransform trans = CGAffineTransformMakeTranslation(0.0f, 380.0f);
                        self.transform = CGAffineTransformRotate(trans, 0);
                    } completion:^(BOOL finished)
                    {
                        [gm cropFruits:self.fruit];
                        [self removeFromSuperview];
                    }];
               }];
          }];
     }];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self crop];
}

- (void) bornAmination
{
    [UIView animateWithDuration:SHAKE_DURATION
                          delay:0.0f
     //                        options:UIViewAnimationOptionCurveLinear
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^
     {
         CGAffineTransform scale = CGAffineTransformMakeScale(1.5, 1.5);
         [self setTransform:scale];
         
     } completion:^(BOOL finished) {
         [UIView animateWithDuration:SHAKE_DURATION
                               delay:0.0f
                             options:UIViewAnimationOptionCurveEaseOut
                          animations:^
          {
              CGAffineTransform scale = CGAffineTransformMakeScale(1.0, 1.0);
              [self setTransform:scale];
              
          } completion:^(BOOL finished) {
              [UIView animateWithDuration:SHAKE_DURATION
                                    delay:0.0f
                                  options:UIViewAnimationOptionCurveEaseOut
                               animations:^
               {
                   CGAffineTransform scale = CGAffineTransformMakeScale(1.2, 1.2);
                   [self setTransform:scale];
                   
               } completion:^(BOOL finished) {
                   [UIView animateWithDuration:1.0f / 2.5f
                                         delay:0
                    //                             options:UIViewAnimationOptionOverrideInheritedDuration
                                       options:UIViewAnimationOptionCurveEaseOut
                                    animations:^
                    {
                        CGAffineTransform scale = CGAffineTransformMakeScale(1.0, 1.0);
                        [self setTransform:scale];
                    } completion:^(BOOL finished)
                    {
                        // none
                    }];
               }];
          }];
     }];
}

// TODO: こすって取れるように
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    LOG_CURRENT_METHOD;
//    [self removeFromSuperview];
//}



@end
