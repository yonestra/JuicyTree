//
//  CollectionManager.h
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/24.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fruits.h"

@interface CollectionManager : NSObject {
    NSMutableArray* collections;   // identifier -> FruitsObject
}

@property (nonatomic, retain) NSMutableArray* collections;

+ (CollectionManager*)sharedCollectionManager;
- (BOOL)addFruits:(Fruits*)fruit;

@end
