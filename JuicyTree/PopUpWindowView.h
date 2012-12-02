//
//  PopUpWindowView.h
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/12/02.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PopUpWindowDelegate;

@interface PopUpWindowView : UIView

@property (nonatomic, assign) NSInteger type;
@property (nonatomic, strong) NSString* message;
@property (nonatomic, assign) id<PopUpWindowDelegate> delegate;

- (id)initWithFrame:(CGRect)frame type:(NSInteger)type message:(NSString*)message;
- (void)appearPopUpWindowWithAnimation:(BOOL)animated;
- (void)closePopUpWindow;

@end


@protocol PopUpWindowDelegate <NSObject>

- (void)selectAtIndex:(NSInteger)index;

@end