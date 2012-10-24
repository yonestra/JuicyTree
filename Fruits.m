//
//  Fruits.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import "Fruits.h"

@implementation Fruits

@synthesize positionId;
@synthesize imageName;
@synthesize identifier;
@synthesize name;
@synthesize points;


- (Fruits*)initWithId:(NSInteger)_identifier name:(NSString*)_name imageName:(NSString*)_imageName points:(NSInteger)_points {
    if (self = [super init]) {
        self.identifier = _identifier;
        self.name       = _name;
        self.imageName  = _imageName;
        self.points     = _points;
    }
    return self;
}

- (void)dealloc {
    [name release], name=nil;
    [imageName release], imageName=nil;
    [super dealloc];
}

@end


/** りんご **/
@implementation FruitApple

- (FruitApple*)init {
    if (self = [super init]) {
        self.identifier = APPLE;
        self.name = @"りんご";
        self.imageName = @"apple.png";
        self.points = 10;
    }
    return self;
}

@end

/** バナナ **/
@implementation FruitBanana

- (FruitBanana*)init {
    if (self = [super init]) {
        self.identifier = BANANA;
        self.name = @"バナナ";
        self.imageName = @"banana.png";
        self.points = 20;
    }
    return self;
}

@end


/** ハテナ **/
@implementation FruitHatena

- (FruitHatena*)init {
    if (self = [super init]) {
        self.identifier = HATENA;
        self.name = @"ハテナ";
        self.imageName = @"hatena.png";
        self.points = 0;
    }
    return self;
}

@end

