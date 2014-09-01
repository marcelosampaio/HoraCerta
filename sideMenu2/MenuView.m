//
//  MenuView.m
//  HoraCerta
//
//  Created by Marcelo Sampaio on 8/4/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "MenuView.h"

@implementation MenuView
@synthesize closeOutlet;
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
- (IBAction)closeMenu:(id)sender {
    self.listener=[[Listener alloc]init];
    [self.listener updateMenuWithAction:0];
    [self close];

}
- (IBAction)optionOne:(id)sender {
    self.listener=[[Listener alloc]init];
    [self.listener updateMenuWithAction:1];
    [self close];
}
- (IBAction)optionTwo:(id)sender {
    self.listener=[[Listener alloc]init];
    [self.listener updateMenuWithAction:2];
    [self close];
}


#pragma mark - Working Methods
-(void)close {
    // Animate keyboard
    [UIView animateWithDuration:0.2 animations:^(void){
        //Animacao
        
        self.alpha=1;
        self.center=CGPointMake(-110, 568/2);
        
        
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
