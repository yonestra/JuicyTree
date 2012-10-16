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

- (GameManager*)init {
    self = [super init];
    if (self) {
        // TODO: NSUserDefaultから読み込む
        FruitsOnTreeDictionary = [NSMutableDictionary dictionary];
        totalPoint = 0;
        time = 0;
    }
    return self;
}

- (void)dealloc {
    [sharedGameManager release];
}

// 時間の計測を開始
- (void)startTimer {
    NSTimer *timer;
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(checkStatusByOneMinutes)
                                           userInfo:nil
                                            repeats:YES];

}

// 1秒ごとに状態をチェック
-(void)checkStatusByOneMinutes:(NSTimer*)timer
{
    // 時間カウント
    time++;
    
    // 5秒ごとに実を作る
    if (time%5 == 0) {
        [self createFruits];
        // TODO: ViewController側にPUSHする処理
    }
}



// 実らせる果実を決める
// TODO: ツリーレベルを考慮
- (Fruits*)selectFruits {
    LOG_CURRENT_METHOD;
    Fruits* fruit;
    int r = arc4random() % 2;
    switch (r) {
        case 0:
            fruit = [[[FruitApple alloc] init] autorelease];
            break;
        case 1:
            fruit = [[[FruitBanana alloc] init] autorelease];
            break;
        default:
            break;
    }
    return fruit;
}

// 実を作る
- (Fruits*)createFruits {
    LOG_CURRENT_METHOD;
    // 場所決める
    NSInteger position = [self getBrunkPosition];
    
    if (position == -1) {
        // 場所空いてないよ！
        return nil;
    }
    else {
        // 果実作って返す
        Fruits* fruit = [self selectFruits];
        fruit.positionId = position;
        [FruitsOnTreeDictionary setObject:fruit forKey:[NSString stringWithFormat:@"%d", position]];
        return fruit;
    }
}

// 実を複数作る
// return: NSArray<Fruits>
- (NSArray*)createFruitsArray:(NSInteger)count {
    LOG_CURRENT_METHOD;
    NSMutableArray* fruitsArray = [NSMutableArray array];
    
    Fruits* fruit;
    for (int i=0; i<count; i++) {
        if ( (fruit = [self createFruits]) != nil) {
            [fruitsArray addObject:[self createFruits]];
        } else {
            break;
        }
    }
    return fruitsArray;
}

// 木の空いてる場所を返す
- (NSInteger)getBrunkPosition {
    NSArray* positionIds = [FruitsOnTreeDictionary allKeys];
    
    // 空いてる場所がない！
    if ([positionIds count] == 20) {
        return -1;
    }
    
    int brunkPos;
    while (1) {
        brunkPos = arc4random() % 20;
        if ( ![positionIds containsObject:[NSString stringWithFormat:@"%d", brunkPos]] ) {
            break;
        }
    }
    return brunkPos;
}

// 果実収穫メソッド
- (void)cropFruits:(Fruits*)fruits {
    // ポイントを加算
    totalPoint += fruits.points;
    [self judgeLevelUpTree];
    
    // スペース空いたことを知らせる
    NSInteger key = fruits.positionId;
    [FruitsOnTreeDictionary removeObjectForKey:[NSString stringWithFormat:@"%d", key]];
}

// 木進化判定メソッド
- (void)judgeLevelUpTree {
    LOG(@"現在のポイント: %d", totalPoint);
    // あるポイントを超えたら木を進化させる
    if (totalPoint > 200) {
        [self levelUpTree];
    }
}

// 木進化メソッド
- (void)levelUpTree {
    LOG_CURRENT_METHOD;
    // ポイントの処理
    // tree_levelを+1
    // ViewControllerにお知らせ
}

@end
