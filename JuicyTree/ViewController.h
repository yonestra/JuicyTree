//
//  ViewController.h
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/16/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameManager.h"

@interface ViewController : UIViewController {
    GameManager* gameManager;
    UIImageView *backgroundImageView;
    UIView* gaugeBodyView;      // ゲージ
}

@end
