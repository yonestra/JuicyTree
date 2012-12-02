//
//  AppDelegate.m
//  JuicyTree
//
//  Created by 米澤 翔太 on 10/16/12.
//  Copyright (c) 2012 Toraemon. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "CollectionManager.h"

@interface AppDelegate ()

- (void)loadData;
- (void)saveData;

@end

@implementation AppDelegate

@synthesize navController;

- (void)dealloc
{
    [_window release];
    [navController release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setDefaultValue];
    [self loadData];
    
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    ViewController *vc = [[[ViewController alloc] initWithNibName:@"ViewController" bundle:nil] autorelease];
    self.navController = [[[UINavigationController alloc] initWithRootViewController:vc] autorelease];
    [self.navController setNavigationBarHidden:YES animated:NO];
    self.window.rootViewController = self.navController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    
    [self saveData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    
}


#pragma mark -
#pragma mark loadAndSaveData

// 保存データのデフォルト値を設定する
- (void)setDefaultValue {
    // NSUserDefaultsに初期値を登録する
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];  // 取得
    NSMutableDictionary *defaultDictionary = [NSMutableDictionary dictionary];
    [defaultDictionary setObject:@"1" forKey:@"treeLevel"];  // をKEY_Iというキーの初期値は99
    [defaultDictionary setObject:@"0" forKey:@"totalPoint"];  // をKEY_Fというキーの初期値は99.99
//    [defaultDictionary setObject:nil forKey:@"fruitsOnTreeDictionary"];  // をKEY_Dというキーの初期値は88.88
//    [defaultDictionary setObject:nil forKey:@"collections"];  // をKEY_Bというキーの初期値はYES
//    [defaultDictionary setObject:nil forKey:@"finDate"];  // をKEY_Sというキーの初期値はhoge
    [defaults registerDefaults:defaultDictionary];
}

// データを復元する
- (void)loadData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    GameManager *gm = [GameManager sharedGameManager];
    
    // 木レベル
    gm.treeLevel = [defaults integerForKey:@"treeLevel"];
    
    // 現在の保持ポイント
    gm.totalPoint = [defaults integerForKey:@"totalPoint"];
    [gm updateFruitCurrentLevelList];
    
    // 木に成っている果実
    NSData *data = [defaults objectForKey:@"fruitsOnTreeDictionary"];
    if (data != nil) {
        gm.fruitsOnTreeDictionary = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
    
    // コレクション情報
    NSArray *collectionArray = [defaults arrayForKey:@"collections"];
    if (collectionArray != nil) {
        [CollectionManager sharedCollectionManager].collections
        = [NSMutableArray arrayWithArray:collectionArray];
    }
    
    // アプリ終了時間
    NSDate* finDate = [defaults objectForKey:@"finDate"];
    if (finDate != nil) {
        NSDate* now = [NSDate date];
        NSTimeInterval duration = [now timeIntervalSinceDate:finDate];
        //GameManager* gameManager = [GameManager sharedGameManager];
        //[gameManager checkStatusByLaunchApplication:duration];
    }
}

// データを保存する
- (void)saveData {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    GameManager *gm = [GameManager sharedGameManager];
    
    // 木レベル
    [defaults setInteger:gm.treeLevel forKey:@"treeLevel"];
    
    // 現在の保持ポイント
    [defaults setInteger:gm.totalPoint forKey:@"totalPoint"];
    
    // 木に成っている果実
    LOG(@"fruits = %@", gm.fruitsOnTreeDictionary);
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:gm.fruitsOnTreeDictionary];
    [defaults setObject:data forKey:@"fruitsOnTreeDictionary"];
    
    // コレクション情報
    NSMutableArray *collectionMutableArray = [CollectionManager sharedCollectionManager].collections;
    NSArray *collectionArray = [NSArray arrayWithArray:collectionMutableArray];
    [defaults setObject:collectionArray forKey:@"collections"];
    
    //　アプリ終了時間
    NSDate* finDate = [NSDate date];
    [defaults setObject:finDate forKey:@"finDate"];
    
    [defaults synchronize];
}


@end
