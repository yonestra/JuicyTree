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
    UIImageView* imageView;
    NSInteger points;
    NSInteger tree_level;
}

@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, retain) NSString* name;
@property (nonatomic, retain) UIImageView* imageView;
@property (nonatomic, assign) NSInteger points;
@property (nonatomic, assign) NSInteger tree_level;


@end
