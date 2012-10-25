//
//  Constants.h
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/17/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

//#import <UIKit/UIKit.h>
//#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

#ifndef JuicyTree_Constants_h
#define JuicyTree_Constants_h


#define POS_1_X 10
#define POS_1_Y 10

#define POS_2_X 120
#define POS_2_Y 10

#define POS_3_X 220
#define POS_3_Y 10

#define M_PI 3.14159265358979323846264338327950288 /* pi */
#define M_PI_2 1.57079632679489661923132169163975144 /* pi/2 */
#define M_PI_4 0.785398163397448309615660845819875721 /* pi/4 */

#define SHAKE_ROTATE 0.4f
#define SHAKE_DURATION 0.1f


// ゲームマネージャー
#define CREATE_FRUIT_DURATION_TIME 2   // この時間が経過したら木に実をつける
#define CREATE_FRUIT_MAX_COUNT  20      // 木に成る限界の実の個数

// 木のレベルアップ表
#define TREE_LEVEL_UP_LINE_LV_1 20
#define TREE_LEVEL_UP_LINE_LV_2 300
#define TREE_LEVEL_UP_LINE_LV_3 1000
#define TREE_LEVEL_UP_LINE_LV_4 2000
#define TREE_LEVEL_UP_LINE_LV_5 5000
#define TREE_LEVEL_UP_LINE_LV_6 10000
#define TREE_LEVEL_UP_LINE_LV_7 20000
#define TREE_LEVEL_UP_LINE_LV_8 50000
#define TREE_LEVEL_UP_LINE_LV_9 100000

// コレクションビュー
#define COLLECTION_FRUIT_PER_PAGE 6     // 1ページあたりに表示する果物

// 通知（NotificationCenter）の種類
#define NOTIFICATION_CREATE_FRUIT @"notificationCreateFruit"
#define NOTIFICATION_LELEL_UP_TREE @"notificationLevelUpTree"




//#define POS_1 CGRectMake(10, 10, 80, 80)
//#define POS_2 CGRectMake(10, 120, 80, 80)
//#define POS_3 CGRectMake(10, 230, 80, 80)

//NSMutableDictionary const *positions = [NSMutableDictionary dictionaryWithObjectsAndKeys:
//    CGRectMake(10, 10, 80, 80), 1,
//    CGRectMake(10, 10, 80, 80), 2,
//    CGRectMake(10, 10, 80, 80), 3,
//    nil
//];

#endif
