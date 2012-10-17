//
//  AppDelegate.h
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/16/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    UINavigationController *navController;
}

@property (strong, nonatomic) UIWindow *window;
@property (retain, nonatomic) UINavigationController *navController;

@end
