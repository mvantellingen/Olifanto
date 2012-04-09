//
//  PGWindowController.h
//  PGview
//
//  Created by Michael van Tellingen on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "OLToolbarController.h"

@class PSMTabBarControl;

@interface OLWindowController : NSWindowController
{
    IBOutlet PSMTabBarControl *tabBar;
    IBOutlet NSTabView *tabView;
    IBOutlet NSToolbar *toolBar;
    IBOutlet OLToolbarController *toolbarController;
    NSView *activeTabView;
}

- (void)awakeFromNib;
- (IBAction)addTabPanel:(id)sender;
- (IBAction)closeTab:(id)sender;
- (void) selectTable:(NSString *)tableName;
- (IBAction)openConnection:(id)connection;
@end
