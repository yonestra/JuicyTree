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

- (id)copyWithZone:(NSZone *)zone
{
    Fruits* copy = [[[self class] allocWithZone:zone] init];
    
    copy.identifier = identifier;
    copy.imageName  = imageName;
    copy.name       = name;
    copy.points     = points;
    
    return copy;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeInteger:identifier forKey:@"identifier"];
    [aCoder encodeObject:name forKey:@"name"];
    [aCoder encodeObject:imageName forKey:@"imageName"];
    [aCoder encodeInteger:points forKey:@"points"];
    [aCoder encodeInteger:positionId forKey:@"positionId"];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self.identifier = [aDecoder decodeIntegerForKey:@"identifier"];
    self.name = [aDecoder decodeObjectForKey:@"name"];
    self.imageName = [aDecoder decodeObjectForKey:@"imageName"];
    self.points = [aDecoder decodeIntegerForKey:@"points"];
    self.positionId = [aDecoder decodeIntegerForKey:@"positionId"];
    
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

