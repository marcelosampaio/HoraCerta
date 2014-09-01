//
//  TopMenuView.m
//  HoraCerta
//
//  Created by Marcelo Sampaio on 8/5/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "TopMenuView.h"


@implementation TopMenuView
@synthesize listener;

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
    [self closeWithAction:1];
}

- (IBAction)optionTwo:(id)sender {
    [self closeWithAction:2];
}

- (IBAction)closeMenu:(id)sender {
    [self closeWithAction:0];
}

#pragma mark - Working Methods
-(void)closeWithAction:(int)action {
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
             // update listener
             self.listener=[[Listener alloc]init];
             [self.listener updateMenuWithAction:action];
             
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
