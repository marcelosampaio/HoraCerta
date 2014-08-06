//
//  ViewController.h
//  sideMenu2
//
//  Created by Marcelo Sampaio on 8/4/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *menuOutlet;
@property (weak, nonatomic) IBOutlet UIButton *menuTop;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *containerViewTop;

@property (strong,nonatomic) NSTimer *timer;

@property BOOL menuIsOnTheScreen;

@end
