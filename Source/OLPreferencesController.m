//
//  OLPreferencesController.m
//  Olifant
//
//  Created by Michael van Tellingen on 4/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "OLPreferencesController.h"

@implementation OLPreferencesController

- (id)initWithWindow:(NSWindow *)window
{
    self = [super initWithWindow:window];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

- (BOOL)canBecomeKeyWindow
{
	return YES;
}

@end
