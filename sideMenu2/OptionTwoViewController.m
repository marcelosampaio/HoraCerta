//
//  OptionTwoViewController.m
//  sideMenu2
//
//  Created by Marcelo Sampaio on 8/6/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "OptionTwoViewController.h"

@interface OptionTwoViewController ()

@end

@implementation OptionTwoViewController

#pragma mark - Initialization
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
    
}

#pragma mark - UI Actions
- (IBAction)close:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Status Bar
-(BOOL)prefersStatusBarHidden {
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
