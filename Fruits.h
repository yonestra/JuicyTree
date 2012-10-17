//
//  Fruits.h
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
    APPLE_FRUIT = 0,
    BANANA_FRUIT
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
