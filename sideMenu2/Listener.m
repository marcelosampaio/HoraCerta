//
//  Listener.m
//  HoraCerta
//
//  Created by Marcelo Sampaio on 8/6/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import "Listener.h"


@implementation Listener

-(void)updateMenuWithAction:(int)action {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSString stringWithFormat:@"%d",action] forKey:MENU_ACTION];
    [defaults synchronize];
}

-(int)menuAction {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [[defaults objectForKey:MENU_ACTION]intValue];
}
@end
