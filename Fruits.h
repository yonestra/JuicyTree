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
    HATENA = 999
};

@interface Fruits : NSObject {
    NSInteger identifier;
    NSString* name;
    NSString* imageName;
    NSInteger points;
    NSInteger positionId;
}

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) NSString* imageName;
@property (nonatomic, assign) NSInteger points;
@property (nonatomic, assign) NSInteger positionId;

- (Fruits*)initWithId:(NSInteger)_identifier
                 name:(NSString*)_name
            imageName:(NSString*)_imageName
               points:(NSInteger)_points;

@end

// ハテナブロック
@interface FruitHatena : Fruits @end
