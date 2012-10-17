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

/**
　よねちゃん実装しといてメモ
　【果物つくって通知】
　NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
　[notificationCenter addObserver:self selector:@selector(hogehoge:) name:@"createFruits" object:fruitsArray];
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
        FruitsOnTreeDictionary = [[NSMutableDictionary alloc] init];
        totalPoint = 0;
        time = 0;
        treeLevel = 1;
        [self startTimer];
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
                                           selector:@selector(checkStatusByOneMinutes:)
                                           userInfo:nil
                                            repeats:YES];

}

// 1秒ごとに状態をチェック
- (void)checkStatusByOneMinutes:(NSTimer*)timer
{
    // 時間カウント
    time++;
    LOG(@"time = %d", time);
    
    // 2分ごとに実を作る
//    if (time%120 == 0) {
    if (time%2 == 0) {
        [self createFruitsArray:1];
        // TODO: ViewController側にPUSHする処理
    }
}

// アプリ起動時に状態をチェック
- (void)checkStatusByLaunchApplication:(NSInteger)duration {
    LOG_CURRENT_METHOD;
    LOG(@"duration = %d", duration);
    int numOfFruits = duration/2;
    if (numOfFruits >=20) {
        numOfFruits = 20;
    }
    [self createFruitsArray:numOfFruits];
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
- (void)createFruitsArray:(NSInteger)count {
    LOG_CURRENT_METHOD;
    NSMutableArray* fruitsArray = [NSMutableArray array];
    
    Fruits* fruit;
    for (int i=0; i<count; i++) {
        if ( (fruit = [self createFruits]) != nil) {
            [fruitsArray addObject:fruit];
        } else {
            break;
        }
    }
    [self notificateMainView:fruitsArray];
}

// メイン画面に「実を作って！」とお願いする
// お願いの際には、実の情報Arrayを渡す
- (void)notificateMainView:(NSArray*)fruitsArray {
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"createFruits" object:self userInfo:fruitsArray];
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
    //[self judgeLevelUpTree];
    LOG(@"とくてん: %d", totalPoint);
    
    // スペース空いたことを知らせる
    NSInteger key = fruits.positionId;
    [FruitsOnTreeDictionary removeObjectForKey:[NSString stringWithFormat:@"%d", key]];
}

// 木進化判定メソッド
- (void)judgeLevelUpTree:(NSInteger)point {
    // あるポイントを超えたら木を進化させる
    if (point > 200) {
        [self levelUpTree];
    }
}

// 木進化メソッド
- (void)levelUpTree {
    LOG_CURRENT_METHOD;
    treeLevel++;
    
    // ポイントの処理
    // ViewControllerにお知らせ
}


// posID -> CGRectの変換
+ (CGRect)positionId2Rect:(NSInteger)positionId {
    float w = FRUITS_WIDTH;
    float h = FRUITS_HEIGHT;
    
//    switch (positionId) {
//        case 0:
//            return CGRectMake(10, 10, w, h);
//        case 1:
//            return CGRectMake(60, 10, w, h);
//        case 2:
//            return CGRectMake(150, 30, w, h);
//        default:
//            return CGRectMake((positionId+1)*20+10, (positionId+1)*20+10, w, h);
//    }
    
    int x = arc4random() % 280;
    x += 20;
    
    int y = arc4random() % 380;
    y += 50;
    
    return CGRectMake(x, y, w, h);
    
}

@end
