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

+ (CollectionManager*)sharedCollectionManager {
    if (collectionManager == nil) {
        collectionManager = [[self alloc] init];
    }
    return collectionManager;
}

- (CollectionManager*)init {
    if (self = [super init]) {
        collections = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)dealloc {
    [collections release], collections = nil;
    [super dealloc];
}

- (BOOL)addFruits:(Fruits*)fruit {
    NSString* fruit_id = [NSString stringWithFormat:@"%d", fruit.identifier];
    if ([collections containsObject:fruit_id]) {
        return NO;
    }
    else {
        [collections addObject:fruit_id];
        LOG(@"collections = %@", collections);
        return YES;
    }
}

@end
