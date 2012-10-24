//
//  Fruits.h
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <Foundation/Foundation.h>

enum FRUITS {
    APPLE = 0,
    BANANA,
    
};

@interface Fruits : NSObject {
    NSInteger identifier;
    NSString* name;
    NSString* imageName;
    NSInteger points;
    NSInteger requiredTreeLevel;
    NSInteger positionId;
}

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* imageName;
@property (nonatomic, assign) NSInteger points;
@property (nonatomic, assign) NSInteger requiredTreeLevel;
@property (nonatomic, assign) NSInteger positionId;

@end



// 各種フルーツの宣言

// くだもの
@interface FruitApple : Fruits @end     // りんご
@interface FruitBanana : Fruits @end    // ばなな
@interface FruitMikan : Fruits @end     // みかん
@interface FruitBudo : Fruits @end      // ぶどう
@interface FruitPeach : Fruits @end     // もも
@interface FruitPineApple : Fruits @end // パイナップル

// やさい
@interface FruitNasu : Fruits @end
@interface FruitOnion : Fruits @end
@interface FruitCarrot : Fruits @end
@interface FruitKyuri : Fruits @end
@interface FruitEndomame : Fruits @end
@interface FruitPman : Fruits @end
@interface FruitShimeji : Fruits @end
@interface FruitSuika : Fruits @end

// 上級たべもの
@interface FruitCola : Fruits @end
@interface FruitCurry : Fruits @end
@interface FruitPotechi : Fruits @end

// カオス
@interface FruitClock : Fruits @end
@interface FruitSoccerball: Fruits @end
@interface FruitAkuma : Fruits @end
@interface FruitMaruhi : Fruits @end
@interface FruitGlasses : Fruits @end
@interface FruitIphone : Fruits @end
@interface FruitCrown : Fruits @end
