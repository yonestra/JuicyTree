//
//  PopUpWindowView.m
//  JuicyTree
//
//  Created by 平松 亮介 on 2012/12/02.
//  Copyright (c) 2012年 Toraemon. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "PopUpWindowView.h"

@implementation PopUpWindowView
@synthesize type = type_;
@synthesize message = message_;
@synthesize delegate = delegate_;

- (id)initWithFrame:(CGRect)frame type:(NSInteger)type message:(NSString*)message {
    self = [super initWithFrame:frame];
    if (self) {
        self.type = type;
        self.message = message;
        
        // 背景色
        self.backgroundColor = [UIColor whiteColor];
        
        // 影
        self.layer.shadowOpacity = 0.5;
        self.layer.shadowOffset = CGSizeMake(0.0, 1.0);
        
        // メッセージラベル
        UILabel *messageLabel = [[[UILabel alloc] initWithFrame:CGRectMake(15, 20, 280, 18)] autorelease];
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.text = self.message;
        messageLabel.numberOfLines = 0;
        [self addSubview:messageLabel];
        
        // ボタン
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn1 setTitle:@"OK" forState:UIControlStateNormal];
        [btn1 addTarget:self action:@selector(tapOKButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn1];
        if (type == 0) {
            btn1.frame = CGRectMake(10, 100, 280, 40);
        }
        else if (type == 1) {
            btn1.frame = CGRectMake(10, 100, 140, 40);
            
            UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            [btn2 setTitle:@"Cancel" forState:UIControlStateNormal];
            [btn2 addTarget:self action:@selector(tapCancelButton) forControlEvents:UIControlEventTouchUpInside];
            btn2.frame = CGRectMake(150, 100, 140, 40);
            [self addSubview:btn2];
        }
        
        // 作成時は隠す
        self.hidden = YES;
    }
    return self;
}

// ウインドウを表示させる
- (void)appearPopUpWindowWithAnimation:(BOOL)animated {
    if (animated) {
        CGAffineTransform trans = self.transform;
        self.transform = CGAffineTransformScale(trans, 1.0, 0.0);
        self.hidden = NO;
        
        [UIView animateWithDuration:0.2f
                              delay:0.0f
                            options:UIViewAnimationOptionCurveEaseOut
                         animations:^(void) {
                             self.transform = CGAffineTransformScale(trans, 1.0, 1.1);
                         }
                         completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.1f
                                                   delay:0.0f
                                                 options:UIViewAnimationOptionCurveLinear
                                              animations:^(void) {
                                                  self.transform = CGAffineTransformScale(trans, 1.0, 1.0);
                                              }
                                              completion:^(BOOL finished) {
                                                  
                                              }
                              ];
                         }
         ];
    }
    else {
        self.hidden = NO;
    }
}

- (void)closePopUpWindow {
    CGAffineTransform trans = self.transform;
    
    [UIView animateWithDuration:0.2f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void) {
                         self.transform = CGAffineTransformScale(trans, 1.0, 0.0);
                     }
                     completion:^(BOOL finished) {
                         self.transform = trans;
                         self.hidden = YES;
                     }
     ];
}

#pragma mark -
#pragma mark UserAction

- (void)tapOKButton {
    if ([delegate_ respondsToSelector:@selector(selectAtIndex:)]) {
        [delegate_ selectAtIndex:0];
    }
}

- (void)tapCancelButton {
    if ([delegate_ respondsToSelector:@selector(selectAtIndex:)]) {
        [delegate_ selectAtIndex:1];
    }
}

@end
