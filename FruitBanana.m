//
//  FruitBanana.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import "FruitBanana.h"

@implementation FruitBanana

- (FruitBanana*)init {
    self = [super init];
    if (!self) {
        self.identifier = BANANA_FRUIT;
        self.name = @"バナナ";
        self.imageView = [[[UIImageView alloc] init] autorelease];
        self.imageView.image = [UIImage imageNamed:@"banana.jpeg"];
        self.points = 20000000000;
        self.tree_level = 1;
    }
    
    return self;
}

@end
