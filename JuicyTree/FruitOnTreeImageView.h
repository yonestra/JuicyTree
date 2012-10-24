//
//  FruitOnTreeImageView.h
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/17/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Fruits.h"

@interface FruitOnTreeImageView : UIImageView {
    Fruits *fruit;
}

@property (retain, nonatomic) Fruits *fruit;

- (void) bornAmination;

@end
