//
//  ViewController.m
//  sideMenu2
//
//  Created by Marcelo Sampaio on 8/4/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize menuOutlet,menuTop,containerView,containerViewTop;
@synthesize menuIsOnTheScreen;
@synthesize timer;

#pragma mark - View Initialization
- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}

#pragma mark - UI Actions
- (IBAction)menu:(id)sender {
    [self showMenu];
}

- (IBAction)menuTop:(id)sender {
    [self showTopMenu];
}

#pragma mark - Timer Methods
-(void)startTimer {
    [self.timer invalidate];
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(pulse) userInfo:nil repeats:YES];
}
-(void)pulse {
    NSLog(@"....pulsing");
}


#pragma mark - Menu Methods
-(void)showMenu {
    // start timer
    [self startTimer];

    // show menu
    self.menuIsOnTheScreen=YES;
    self.containerView = [[[NSBundle mainBundle] loadNibNamed:@"MenuView" owner:self options:nil] objectAtIndex:0];
    
    self.containerView.center=CGPointMake(-110, self.view.frame.size.height/2);
    self.containerView.alpha=1;
    self.containerView.tag=99999;
    
    [self.view addSubview:self.containerView];
    
    
    // Animate menu
    [UIView animateWithDuration:0.2f animations:^{
        self.containerView.alpha=1;
        self.containerView.center=CGPointMake(110, self.view.frame.size.height/2);
    }];
    
//    self.menuTop.hidden=YES;
    
}

-(void)showTopMenu {
    // start timer
    [self startTimer];
    
    // show menu
    self.containerViewTop = [[[NSBundle mainBundle] loadNibNamed:@"TopMenuView" owner:self options:nil] objectAtIndex:0];
    
    self.containerViewTop.center=CGPointMake(160, -49);
    self.containerViewTop.alpha=1;
    self.containerViewTop.tag=99999;
    
    [self.view addSubview:self.containerViewTop];
    
    // Animate menu
    [UIView animateWithDuration:0.25f animations:^{
        self.containerViewTop.alpha=1;
        self.containerViewTop.center=CGPointMake(160, 49);
    }];
//    self.menuOutlet.hidden=YES;
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.menuIsOnTheScreen) {
        return;
    }
    NSLog(@"touch detected");
    UITouch *myTouch = [touches anyObject];
    CGPoint point = [myTouch locationInView:self.containerView];
    if (CGRectContainsPoint(self.containerView.bounds, point) ) {
        NSLog(@"touched inside container view");
    } else {
        if (self.menuIsOnTheScreen) {
            NSLog(@"touch rejected");
            return;
        }
    }
}

#pragma mark - Status Bar
-(BOOL)prefersStatusBarHidden {
    return YES;
}

@end
