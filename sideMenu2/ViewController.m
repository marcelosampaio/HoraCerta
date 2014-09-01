//
//  ViewController.m
//  HoraCerta
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
@synthesize listener;
@synthesize topMenu;


#pragma mark - View Initialization
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Listener
    self.listener=[[Listener alloc]init];
    [self.listener updateMenuWithAction:-1];
    
    // Container View
    self.containerView.backgroundColor=[UIColor greenColor];
    
    // View Background
    self.view.backgroundColor=APP_COLOR;
    
    // Analog Clock
    [self analogClock];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    // Menu Type
    self.topMenu=NO;
    
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
    // set listener to initial value
    [self.listener updateMenuWithAction:-1];
    [self.timer invalidate];
    // start timer
    self.timer=[NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(pulse) userInfo:nil repeats:YES];
}
-(void)pulse {
    NSLog(@"....pulsing with Listener=%d",[self.listener menuAction]);
    int menuAction=[self.listener menuAction];
    
    if (menuAction==0) {
        self.menuTop.hidden=NO;
        [self.timer invalidate];
        return;
    } else if (menuAction==1) {
        NSLog(@"segue to option 1");
        [self.timer invalidate];
        [self performSegueWithIdentifier:@"showOptionOne" sender:self];
        self.menuTop.hidden=NO;
        return;
    } else if (menuAction==2) {
        NSLog(@"segue to option 2");
        [self.timer invalidate];
        [self performSegueWithIdentifier:@"showOptionTwo" sender:self];
        self.menuTop.hidden=NO;
        return;
    }
}


#pragma mark - Menu Methods
-(void)showMenu {
    
    // Menu Type
    self.topMenu=NO;
    self.menuTop.hidden=YES;
    
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
    
    // Menu Type
    self.topMenu=YES;
    
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


#pragma mark - Touch Events
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.menuIsOnTheScreen) {
        return;
    }
    NSLog(@"touch detected");
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.containerView];
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

#pragma mark - Analog Clock
-(void)analogClock {
    // add the clock to UI
    int size=200;
    BEMAnalogClockView *clock = [[BEMAnalogClockView alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2-(size/2), self.view.frame.size.height/2-(size/2), size,size)];
    clock.delegate = self;
    clock.tag=1;
    clock.enableShadows = NO;
    clock.realTime = YES;
    clock.currentTime = YES;
    clock.setTimeViaTouch = NO;
    clock.borderColor = APP_DETAIL_COLOR;
    clock.borderWidth = 3.00f;
    clock.faceBackgroundColor = APP_COLOR;
    clock.faceBackgroundAlpha = 1.0;
    clock.digitFont = [UIFont fontWithName:@"HelveticaNeue-Thin" size:17];
    clock.digitColor = APP_DETAIL_COLOR;
    clock.enableDigit = YES;
    clock.enableGraduations = YES;
    clock.hourHandColor=APP_DETAIL_COLOR;
    clock.hourHandOffsideLength=0;
    clock.hourHandLength=35;
    clock.minuteHandColor=APP_DETAIL_COLOR;
    clock.minuteHandOffsideLength=0;
    clock.minuteHandLength=55;
    clock.secondHandColor=APP_DETAIL_COLOR;
    clock.secondHandOffsideLength=0;
    clock.secondHandAlpha=0.30f;
    clock.secondHandLength=55;

    [self.view addSubview:clock];
}

#pragma mark - Analog Clock Delegate Methods
- (CGFloat)analogClock:(BEMAnalogClockView *)clock graduationLengthForIndex:(NSInteger)index {
    if (clock.tag == 1) {
        if (!(index % 5) == 1) { // Every 5 graduation will be longer.
            return 20;
        } else {
            return 5;
        }
    }
    else return 0;
}

- (UIColor *)analogClock:(BEMAnalogClockView *)clock graduationColorForIndex:(NSInteger)index {
    if (!(index % 15) == 1) { // Every 15 graduation will be blue.
        return APP_DETAIL_COLOR;
    } else {
        return APP_DETAIL_COLOR;
    }
}

-(CGFloat)analogClock:(BEMAnalogClockView *)clock graduationAlphaForIndex:(NSInteger)index {
    return (CGFloat) 1.00f;
}

//-(CGFloat)analogClock:(BEMAnalogClockView *)clock graduationOffsetForIndex:(NSInteger)index {
//    return 1.00f;
//}

- (void)currentTimeOnClock:(BEMAnalogClockView *)clock Hours:(NSString *)hours Minutes:(NSString *)minutes Seconds:(NSString *)seconds {
    if (clock.tag == 1) {
        int hoursInt = [hours intValue];
        int minutesInt = [minutes intValue];
        int secondsInt = [seconds intValue];
        NSString *temp=[NSString stringWithFormat:@"%02d:%02d:%02d", hoursInt, minutesInt, secondsInt];
        NSLog(@"... pulsing       %@",temp);
    }
}

@end
