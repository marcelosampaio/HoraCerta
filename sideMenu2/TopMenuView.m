//
//  TopMenuView.m
//  sideMenu2
//
//  Created by Marcelo Sampaio on 8/5/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "TopMenuView.h"

@implementation TopMenuView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

#pragma mark - UI Actions

- (IBAction)optionOne:(id)sender {
    NSLog(@"TOP MENU option one");
    [self close];
}

- (IBAction)optionTwo:(id)sender {
    NSLog(@"TOP MENU option two");
    [self close];
}

- (IBAction)closeMenu:(id)sender {
    [self close];
}

#pragma mark - Working Methods
-(void)close {
    // Animate keyboard
    [UIView animateWithDuration:0.2 animations:^(void){
        //Animacao
        
        self.alpha=1;
        self.center=CGPointMake(160, -49);
        
        
    } completion:^(BOOL finished) {
        //codigo a ser executado apos termino da animacao
        // Executar nova nimacao
        [UIView animateWithDuration:0.25f animations:^(void)
         {
             [self removeFromSuperview];
             
         }];
        
    }];
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
