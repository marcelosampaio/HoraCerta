//
//  Listener.h
//  HoraCerta
//
//  Created by Marcelo Sampaio on 8/6/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <Foundation/Foundation.h>

#define MENU_ACTION     @"MenuAction"

@interface Listener : NSObject


-(void)updateMenuWithAction:(int)action;
-(int)menuAction;

@end
