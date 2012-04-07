//
//  PGWindowController.m
//  PGview
//
//  Created by Michael van Tellingen on 11/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OLWindowController.h"
#import "OLMainController.h"


@implementation OLWindowController

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib
{
    [tabBar setCellMinWidth:100];
    [tabBar setCellMaxWidth:250];
    [tabBar setCellOptimumWidth:250];
    [tabBar setCanCloseOnlyTab:NO];
    [tabBar setHideForSingleTab:NO];
    [tabBar setSelectsTabsOnMouseDown:YES];    
    [tabBar setShowAddTabButton:YES];
    [tabBar setTearOffStyle:PSMTabBarTearOffAlphaWindow];    
    [tabBar setSizeCellsToFit:NO];
}

- (IBAction)addTabPanel:(id)sender
{
    printf("addTabPanel\n");
    
    OLMainController *newController = [[OLMainController alloc] 
                                       initWithNibName:@"MainView" bundle:nil];

    NSTabViewItem *newTabItem = [[NSTabViewItem alloc] 
                                 initWithIdentifier:(id)newController];

    [newTabItem setView:[newController view]];
    [tabView addTabViewItem:newTabItem];
    [tabView selectTabViewItem:newTabItem];
    
    [newController showConnectionView];

}

@end
