//
//  MenuView.h
//  HoraCerta
//
//  Created by Marcelo Sampaio on 8/4/14.
//  Copyright (c) 2014 Marcelo Sampaio. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Listener.h"

@interface MenuView : UIView

// Outlet
@property (weak, nonatomic) IBOutlet UIButton *closeOutlet;


// Listener
@property (nonatomic,strong) Listener *listener;


@end
