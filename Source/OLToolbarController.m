//
//  OLToolbarController.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLToolbarController.h"

@implementation OLToolbarController


- (void) awakeFromNib
{
    [databaseSelector setEnabled:false];
}

- (id)delegate 
{
    return self.delegate;
}

- (void) setDbController:(id)newValue
{
    dbController = newValue;
    
    [databaseSelector setEnabled:(dbController != nil)];
    [toolBar validateVisibleItems];
    
    if (dbController) {
        [self refreshDatabases];
    }
}

- (void) refreshDatabases
{
    NSArray *databases = [dbController getDatabases];

    [databaseSelector removeAllItems];
    
    [databaseSelector addItemWithTitle:@"Choose database"];
    [[databaseSelector menu] addItem:[NSMenuItem separatorItem]];
    NSEnumerator *e = [databases objectEnumerator];
    NSMenuItem *menuItem;
    NSString *databaseName;

    while (databaseName = [e nextObject]) {
        menuItem = [[NSMenuItem alloc] init];
        [menuItem setTitle: databaseName];
        [menuItem setTag: 1];
        [[databaseSelector menu] addItem:menuItem];
    }
}

- (IBAction) openQueryView:(id)sender
{
    [dbController openQueryView];
}

- (IBAction) openContentView:(id)sender
{
    [dbController openContentView];
}


- (IBAction) openDatabase:(id)sender 
{
    NSString *database = [sender titleOfSelectedItem];
    
    if ([sender selectedTag] == 1) {
        [dbController openDatabase: database];
        [sender setTitle: database];
        currentDatabase = database;
    }
    else {
        currentDatabase = nil;
    }
    [toolBar validateVisibleItems];
}

- (BOOL)validateToolbarItem:(NSToolbarItem *)toolbarItem
{
    return (currentDatabase != nil);
}
@end
