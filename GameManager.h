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
    NSMutableArray* fruitList;                   // このゲームで扱う全ての果物リスト
    NSMutableDictionary* FruitsOnTreeDictionary; // 現在木になっている果物の情報リスト（posId -> fruit）
    NSInteger totalPoint;                        // ユーザが保持しているポイント
    NSInteger treeLevel;                         // ユーザの現在の木レベル
    
    NSInteger time;                              // タイマー用
}

@property (nonatomic, retain) NSArray* fruitList;

+ (GameManager*)sharedGameManager;
- (void)createFruitList;
- (void)checkStatusByLaunchApplication:(NSInteger)duration;
- (void)cropFruits:(Fruits*)fruits;
- (void)judgeLevelUpTree:(NSInteger)point;
+ (CGRect)positionId2Rect:(NSInteger)positionId;
- (Fruits*)objectAtFruitId:(NSInteger)fruitId;

@end
