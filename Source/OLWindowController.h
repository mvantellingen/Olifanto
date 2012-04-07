//
//  PGWindowController.h
//  PGview
//
//  Created by Michael van Tellingen on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <AppKit/AppKit.h>
#import <PSMTabBarControl.h>

@interface OLWindowController : NSWindowController
{
    IBOutlet PSMTabBarControl *tabBar;
    IBOutlet NSTabView *tabView;
}

- (void)awakeFromNib;
- (IBAction)addTabPanel:(id)sender;
@end
