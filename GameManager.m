//
//  GameManager.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import "GameManager.h"

@implementation GameManager

/**
  つかいかたメモ
  GameManager* gameManager = [GameManager sharedGameManager];
 
 **/
 
static GameManager* sharedGameManager = nil;

+ (GameManager*)sharedGameManager {
    if (sharedGameManager == nil) {
        sharedGameManager = [[self alloc] init];
    }
    return sharedGameManager;
}


- (NSInteger)createFruitId {
    int r = arc4random() % 2;
    return r;
}

@end
