//
//  CollectionViewController.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/10/16.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "CollectionViewController.h"
#import "CollectionManager.h"

@interface CollectionViewController ()

@end

@implementation CollectionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// interface builderを使わない場合はこのメソッドが必要
- (void)loadView{
    self.view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"collection_page.png"]];
    [self.view release];
    
    // *** ページャー ***
    UIView* pager = [[[UIView alloc] initWithFrame:CGRectMake(0, 300, 320, 30)] autorelease];
    
    // 前へ戻るボタン。「←」で表現
    UIButton* prevButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    prevButton.frame = CGRectMake(80, 0, 30, 30);
    [prevButton setTitle:@"←" forState:UIControlStateNormal];
    prevButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [prevButton addTarget:self action:@selector(pushPrevButton) forControlEvents:UIControlEventTouchUpInside];
    [pager addSubview:prevButton];
    
    // 現在のページ番号を示すラベル
    pageLabel = [[[UILabel alloc] initWithFrame:CGRectMake(130, 0, 60, 30)] autorelease];
    pageLabel.textAlignment = NSTextAlignmentCenter;
    [pager addSubview:pageLabel];
    
    // 次へ進むボタン。「→」で表現
    UIButton* nextButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    nextButton.frame = CGRectMake(210, 0, 30, 30);
    [nextButton setTitle:@"→" forState:UIControlStateNormal];
    nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [nextButton addTarget:self action:@selector(pushNextButton) forControlEvents:UIControlEventTouchUpInside];
    [pager addSubview:nextButton];
    
    [self.view addSubview:pager];
    
    // *** 戻るボタン ***
    UIButton* backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(5, 10, 67, 40);
    backButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"back_arrow.png"]];
    [backButton addTarget:self action:@selector(pushBackButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
    
    // *** 広告ビュー（仮） ***
    UIView* adView = [[[UIView alloc] initWithFrame:CGRectMake(0, 430, 320, 50)] autorelease];
    adView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:adView];
    
    // *** コレクション表示ビュー ***
    [self reload];
}

// もどるボタンが押された。メイン画面に戻る
- (void)pushBackButton {
    CATransition *animation = [CATransition animation];
    [animation setType:kCATransitionFade];
    [animation setDuration:0.3];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [animation setDelegate:self];
    
    [[self.navigationController.view layer] addAnimation:animation forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}

// ページャの「←」が押された。一つ前のページへ戻る
- (void)pushPrevButton {
    if (page > 0) {
        page--;
    }
    [self reload];
}

// ページャの「→」が押された。一つ先のページへ進む
- (void)pushNextButton {
    if (page < 15) {
        page++;
    }
    [self reload];
}

// コレクションビューを再描画する
-(void)reload {
    // 現在のページ番号をセット
    pageLabel.text = [NSString stringWithFormat:@"%d/16", page+1];
    
    if (fruitSetView != nil) {
        [fruitSetView removeFromSuperview];
        [fruitSetView release], fruitSetView=nil;
    }
    
    fruitSetView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 320, 135)];
    int start = page * COLLECTION_FRUIT_PER_PAGE;
    int col=0, row=0;
    for (int i=start; i<start+COLLECTION_FRUIT_PER_PAGE; i++) {
        // 縦横の位置を取得
        col = (i-start) % 3;
        row = (i-start) / 3;
        
        // 場所情報に相応しい果物を表示
        Fruits* fruit = [[CollectionManager sharedCollectionManager] getFruitByFruitIdentifier:i];
        UIImage* image = [UIImage imageNamed:fruit.imageName];
        UIImageView* imageView = [[[UIImageView alloc] initWithImage:image] autorelease];
        imageView.frame = CGRectMake((50+35)*col, (50+35)*row, 50, 50);
        CALayer* layer = imageView.layer;
        layer.shadowOffset = CGSizeMake(2.5, 2.5);
        layer.shadowColor = [[UIColor blackColor] CGColor];
        layer.shadowOpacity = 0.5;
        
        
        [fruitSetView addSubview:imageView];
        [self.view addSubview:fruitSetView];
        [fruit release];
    }
}

@end
