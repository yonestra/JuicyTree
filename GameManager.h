//
//  GameManager.h
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FruitApple.h"
#import "FruitBanana.h"

@interface GameManager : NSObject {
    NSMutableDictionary* FruitsOnTreeDictionary; // posId -> fruit
    NSInteger totalPoint;
    NSInteger time;
}

+ (GameManager*)sharedGameManager;
- (Fruits*)createFruits;

@end
