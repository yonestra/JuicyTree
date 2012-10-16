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

- (void)dealloc {
    [name release], name=nil;
    [imageView release], imageView=nil;
    [super dealloc];
}

@end
