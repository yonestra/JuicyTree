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
        self.imageView = [[[UIImageView alloc] init] autorelease];
        self.imageView.image = [UIImage imageNamed:@"apple.jpeg"];
        self.points = 10000000000;
        self.tree_level = 1;
    }
    
    return self;
}

@end
