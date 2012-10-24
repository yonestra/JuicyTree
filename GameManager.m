//
//  GameManager.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import "GameManager.h"
#import "CollectionManager.h"

@implementation GameManager

@synthesize fruitList;

static GameManager* sharedGameManager = nil;

// シングルトン。GameManagerオブジェクトを返す
+ (GameManager*)sharedGameManager {
    if (sharedGameManager == nil) {
        sharedGameManager = [[self alloc] init];
    }
    return sharedGameManager;
}

// 初期化
- (GameManager*)init {
    if (self = [super init]) {
        // TODO: NSUserDefaultから読み込む
        FruitsOnTreeDictionary = [[NSMutableDictionary alloc] init];
        totalPoint = 0;
        treeLevel = 1;
        time = 0;
        
        // 果物リストを作る
        [self createFruitList];
        
        // 時間の計測を開始する
        [self startTimer];
    }
    return self;
}

- (void)dealloc {
    [fruitList release], fruitList = nil;
    [sharedGameManager release];
    [super dealloc];
}

// リソースファイルfruits.plistから果物オブジェクトを作り、配列に格納する
- (void)createFruitList {
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* path = [bundle pathForResource:@"fruits" ofType:@"plist"];
    NSArray* fruitListFromPlist = [NSArray arrayWithContentsOfFile:path];
    
    fruitList = [[NSMutableArray alloc] init];
    for (NSDictionary* fruitElem in fruitListFromPlist) {
        Fruits* fruits = [[Fruits alloc] initWithId:[[fruitElem objectForKey:@"id"] intValue]
                                               name:[fruitElem objectForKey:@"name"]
                                          imageName:[fruitElem objectForKey:@"imageName"]
                                             points:[[fruitElem objectForKey:@"points"] intValue]
                          ];
        [fruitList addObject:fruits];
    }
}


// 時間の計測を開始
- (void)startTimer {
    NSTimer *timer;
    // 1秒ごとにcheckStatusByOneMinutesメソッドを呼出
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                             target:self
                                           selector:@selector(checkStatusByOneMinutes:)
                                           userInfo:nil
                                            repeats:YES];

}

// 木の状態をチェックする。時間が来たら実をならす
- (void)checkStatusByOneMinutes:(NSTimer*)timer
{
    time++;
    
    // 2分ごとに実を作る
    if (time%CREATE_FRUIT_DURATION_TIME == 0) {
        // 1つだけ実を作る
        [self createFruitsArray:1];
    }
}

// アプリ起動時にのみ呼ばれる。durationを参考に、実をならす
- (void)checkStatusByLaunchApplication:(NSInteger)duration {
    int numOfFruits = duration/10;
    // 最大個数を超えた時用に調整
    if (numOfFruits >= CREATE_FRUIT_DURATION_TIME) {
        numOfFruits = CREATE_FRUIT_DURATION_TIME;
    }
    [self createFruitsArray:numOfFruits];
}

// 木の空いてる場所を返す
- (NSInteger)getBrunkPosition {
    NSArray* positionIds = [FruitsOnTreeDictionary allKeys];
    
    // 空いてる場所がない！
    if ([positionIds count] == CREATE_FRUIT_MAX_COUNT) {
        return -1;
    }
    
    int brunkPos;
    while (1) {
        brunkPos = arc4random() % CREATE_FRUIT_MAX_COUNT;
        if ( ![positionIds containsObject:[NSString stringWithFormat:@"%d", brunkPos]] ) {
            break;
        }
    }
    return brunkPos;
}

// 実らせる果実を決める
- (Fruits*)selectFruits {
    Fruits* fruit;
    
    // TODO: ツリーレベルを考慮した実の生成
    int r = arc4random() % 23;
    fruit = [self objectAtFruitId:r];
    
    return fruit;
}

// 実を1つだけ作る
- (Fruits*)createFruits {
    // 空いてる場所を教えてもらう
    NSInteger position = [self getBrunkPosition];
    
    // 場所が空いてない場合は諦める
    if (position == -1) {
        return nil;
    }
    else {
        // 果実作って返す
        Fruits* fruit = [self selectFruits];
        fruit.positionId = position;
        // posId->Fruit で場所を登録
        [FruitsOnTreeDictionary setObject:fruit
                                   forKey:[NSString stringWithFormat:@"%d", position]];  
        return fruit;
    }
}

// 実をcount個数分だけ作る
- (void)createFruitsArray:(NSInteger)count {
    NSMutableArray* fruitsArray = [NSMutableArray array];
    
    Fruits* fruit;
    for (int i=0; i<count; i++) {
        if ( (fruit = [self createFruits]) != nil) {
            [fruitsArray addObject:fruit];
        } else {
            break;
        }
    }
    // 実を作って！とメイン画面にお願いする（Notificationを利用）
    [self notificateMainView:fruitsArray];
}

// メイン画面に「実を作って！」とお願いする
// お願いの際には、NSArray<Fruits>を渡す
- (void)notificateMainView:(NSArray*)fruitsArray {
    NSDictionary* param = [NSDictionary dictionaryWithObject:fruitsArray forKey:@"fruitsArray"];
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter postNotificationName:@"createFruits" object:self userInfo:param];
}

// 果実収穫メソッド
- (void)cropFruits:(Fruits*)fruits {
    // ポイント加算
    totalPoint += fruits.points;
    
    // 木のレベルアップが必要かをチェック
    [self judgeLevelUpTree:totalPoint];
    
    // 実のなるスペースを空ける
    NSInteger key = fruits.positionId;
    [FruitsOnTreeDictionary removeObjectForKey:[NSString stringWithFormat:@"%d", key]];
    
    // はじめての実なら、コレクションに追加
    [[CollectionManager sharedCollectionManager] appendFruitsToCollection:fruits];
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
    treeLevel++;
    
    // TODO: ViewControllerに通知
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


- (Fruits*)objectAtFruitId:(NSInteger)fruitId {
    Fruits* fruit;
    
    for (int i=0; i<[fruitList count]; i++) {
        fruit = [fruitList objectAtIndex:i];
        if (fruit.identifier == fruitId) {
            [fruit retain];
            LOG(@"return_fruits = %@", fruit);
            return fruit;
        }
    }
    return NULL;
}


@end
