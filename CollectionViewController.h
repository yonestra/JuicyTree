//
//  CollectionViewController.h
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewController : UIViewController {
    NSInteger page; // ページ番号
    UILabel* pageLabel; // ページラベル
}

@end
