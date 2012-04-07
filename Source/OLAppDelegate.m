//
//  OLAppDelegate.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLAppDelegate.h"
#import "OLWindowController.h"
#import "OLPreferencesController.h"

@implementation OLAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}


- (IBAction)newWindow:(id)sender
{
    OLWindowController *newController = [[OLWindowController alloc] 
                                         initWithWindowNibName:@"MainWindow"];
    NSWindow *newWindow = [newController window];
    [newWindow setDelegate:newController];

    
    [newController addTabPanel:self];
    [newController showWindow:self];
}

- (IBAction)newTab:(id)sender
{
    
    OLWindowController *frontController = nil;
    
    // Iterate over the windows and find the first active window
    for (NSWindow *aWindow in [NSApp orderedWindows]) {
        NSLog(@"Window: %s, Controller: %s", [[aWindow className] UTF8String], 
              [[[aWindow windowController] className] UTF8String]);
        
        if ([[aWindow windowController] isMemberOfClass:[OLWindowController class]]) {
            frontController = [aWindow windowController];
            break;
        }
    }
    
    // Add tab to the frontController of create a new window if it doesn't exist 
    // yet.
    if (!frontController) {
        NSLog(@"Creating new window");
        return [self newWindow:self];
    }
    else {
        [frontController addTabPanel:self];
    }
}

- (IBAction)showPreferences:(id)sender
{
    OLPreferencesController *newController = [[OLPreferencesController alloc] 
                                              initWithWindowNibName:@"Preferences"];   
    NSWindow *window = [newController window];
    [NSApp runModalForWindow:window];
    [NSApp endSheet: window];
}

@end
