//
//  Fruits.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import "Fruits.h"

@implementation Fruits

@synthesize positionId;


- (Fruits*)init {
    self = [super init];
    if (!self) {
        //        self.imageName = @"apple.jpeg";
        int r = arc4random() % 20;
        switch (r) {
            case 0: self.imageName = @"akuma.png"; break;
            case 1: self.imageName = @"apple.png"; break;
            case 2: self.imageName = @"banana.png"; break;
            case 3: self.imageName = @"budo.png"; break;
            case 4: self.imageName = @"carrot.png"; break;
            case 5: self.imageName = @"clock.png"; break;
            case 6: self.imageName = @"cola.png"; break;
            case 7: self.imageName = @"crown.png"; break;
            case 8: self.imageName = @"curry.png"; break;
            case 9: self.imageName = @"endomame.png"; break;
            case 10: self.imageName = @"glasses.png"; break;
            case 11: self.imageName = @"iphone.png"; break;
            case 12: self.imageName = @"kyuri.png"; break;
            case 13: self.imageName = @"maruhi.png"; break;
            case 14: self.imageName = @"mikan.png"; break;
            case 15: self.imageName = @"nasu.png"; break;
            case 16: self.imageName = @"onion.png"; break;
            case 17: self.imageName = @"peach.png"; break;
            case 18: self.imageName = @"pineapple.png"; break;
            case 19: self.imageName = @"pman.png"; break;
            case 20: self.imageName = @"potechi.png"; break;
            case 21: self.imageName = @"risu.png"; break;
        }
    }
    
    return self;
}

- (void)dealloc {
    [name release], name=nil;
    [imageName release], imageName=nil;
    [super dealloc];
}

@end
