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
//        self.imageName = @"banana.jpeg";
        self.points = 20;
        self.requiredTreeLevel = 1;
    }
    
    return self;
}

@end
