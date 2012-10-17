//
//  FruitApple.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import "FruitApple.h"

@implementation FruitApple

- (FruitApple*)init {
    self = [super init];
    if (!self) {
        self.identifier = APPLE_FRUIT;
        self.name = @"りんご";
//        self.imageName = @"apple.jpeg";
        self.points = 10;
        self.requiredTreeLevel = 1;
    }
    
    return self;
}

@end
