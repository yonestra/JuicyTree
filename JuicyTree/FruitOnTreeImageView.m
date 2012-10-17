//
//  FruitOnTreeImageView.m
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/17/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import "FruitOnTreeImageView.h"

@implementation FruitOnTreeImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        LOG_CURRENT_METHOD;
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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    LOG_CURRENT_METHOD;
    [self removeFromSuperview];
}

// TODO: こすって取れるように
//- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    LOG_CURRENT_METHOD;
//    [self removeFromSuperview];
//}



@end
