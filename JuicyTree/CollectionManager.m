//
//  CollectionManager.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/24.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import "CollectionManager.h"

@implementation CollectionManager

@synthesize collections;

static CollectionManager* collectionManager = nil;

// シングルトン。CollectionManagerオブジェクトを返す
+ (CollectionManager*)sharedCollectionManager {
    if (collectionManager == nil) {
        collectionManager = [[self alloc] init];
    }
    return collectionManager;
}

// 初期化
- (CollectionManager*)init {
    if (self = [super init]) {
        // FIXME: リーク?
        collections = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)dealloc {
    [collections release], collections = nil;
    [super dealloc];
}

// 果実をコレクションに追加する
- (BOOL)appendFruitsToCollection:(Fruits*)fruit {
    NSString* fruit_id = [NSString stringWithFormat:@"%d", fruit.identifier];
    if ([collections containsObject:fruit_id]) {
        // 既にコレクションされてる
        return NO;
    }
    else {
        // 初めての実。コレクションに追加する
        [collections addObject:fruit_id];
        return YES;
    }
}

// fruitIdをもとにFruitsオブジェクトを返す
// 修正を加えていく予定
- (Fruits*)getFruitByFruitIdentifier:(NSInteger)fruitIdentifier {
    NSString* fruit_id = [NSString stringWithFormat:@"%d", fruitIdentifier];
    if ([collections containsObject:fruit_id]) {
        switch (fruitIdentifier) {
            case 0:
                return [[FruitApple alloc] init];
            case 1:
                return [[FruitBanana alloc] init];
            case 2:
                return [[FruitApple alloc] init];
            case 3:
                return [[FruitBanana alloc] init];
            case 4:
                return [[FruitApple alloc] init];
            case 5:
                return [[FruitBanana alloc] init];
            default:
                return [[FruitBanana alloc] init];
        }
    }
    else {
        return [[FruitHatena alloc] init];
    }
}


@end
