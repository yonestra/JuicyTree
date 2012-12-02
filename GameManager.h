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
    NSMutableArray* fruitCurrentLevelList;       // 現在のレベルで成る可能性のある果物リスト
    NSInteger totalPoint;                        // ユーザが保持しているポイント
    NSInteger treeLevel;                         // ユーザの現在の木レベル
    NSInteger time;                              // タイマー用
}

@property (nonatomic, retain) NSArray* fruitList;
@property (nonatomic, retain) NSMutableArray* fruitCurrentLevelList;
@property (nonatomic, retain) NSMutableDictionary* fruitsOnTreeDictionary;  // 現在木になっている果物の情報リスト（posId -> fruit）
@property (nonatomic, assign) NSInteger totalPoint;
@property (nonatomic, assign) NSInteger treeLevel;

+ (GameManager*)sharedGameManager;
- (void)createFruitList;
- (void)updateFruitCurrentLevelList;
- (void)initFruitArrayOnTree;
- (void)checkStatusByLaunchApplication:(NSInteger)duration;
- (void)cropFruits:(Fruits*)fruits;
- (void)judgeLevelUpTree:(NSInteger)point;
+ (CGRect)positionId2Rect:(NSInteger)positionId;
- (Fruits*)objectAtFruitId:(NSInteger)fruitId;
- (NSInteger)pointToNextLevel;

@end
