//
//  Animal.h
//  JuicyTree
//
//  Created by 米澤 翔太 on 12/2/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AnimalDelegate <NSObject>

-(void)gainPoint;
-(void)removeMe;
-(void)adViewLiftup;
-(void)adViewDown;

@end

@interface Animal : UIView
{
    int _points;
    int _patern;
    UIImageView *_animatingImageView;
    UILabel *_pointLabel;
}

@property (nonatomic, assign) id<AnimalDelegate> delegate;

@end
