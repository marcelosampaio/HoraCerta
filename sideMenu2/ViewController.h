//
//  ViewController.h
//  HoraCerta
//
//  Created by Marcelo Sampaio on 8/4/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listener.h"
#import "BEMAnalogClockView.h"

// App Color
#define APP_COLOR               [UIColor colorWithRed:0.05f green:0.50f blue:0.20f alpha:1]
#define APP_DETAIL_COLOR        [UIColor whiteColor]


@interface ViewController : UIViewController<BEMAnalogClockDelegate>

@property (weak, nonatomic) IBOutlet UIButton *menuOutlet;
@property (weak, nonatomic) IBOutlet UIButton *menuTop;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *containerViewTop;

@property (strong,nonatomic) NSTimer *timer;

@property BOOL menuIsOnTheScreen;


// Listener
@property (nonatomic,strong) Listener *listener;

// Menu Type
@property BOOL topMenu;

@end
