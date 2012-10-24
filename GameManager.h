//
//  GameManager.h
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fruits.h"


#define FRUITS_WIDTH  50
#define FRUITS_HEIGHT 50

@interface GameManager : NSObject {
    NSMutableDictionary* FruitsOnTreeDictionary; // posId -> fruit
    NSInteger totalPoint;
    NSInteger time;
    NSInteger treeLevel;
}

+ (GameManager*)sharedGameManager;
- (void)checkStatusByLaunchApplication:(NSInteger)duration;
- (void)cropFruits:(Fruits*)fruits;
- (void)judgeLevelUpTree:(NSInteger)point;
+ (CGRect)positionId2Rect:(NSInteger)positionId;

@end
