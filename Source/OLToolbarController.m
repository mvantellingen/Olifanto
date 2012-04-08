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

- (void) test
{
    NSLog(@"YES I WORK YES");   
}

- (id)delegate 
{
    return self.delegate;
}

- (void) setDelegate:(id)newValue
{
    delegate = newValue;
    
    [databaseSelector setEnabled:(delegate != nil)];
    [toolBar validateVisibleItems];
    
    if (delegate) {
        [self refreshDatabases];
    }
}

- (void) refreshDatabases
{
    NSArray *databases = [delegate getDatabases];

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
    NSLog(@"Open query view");
    [self.delegate openQueryview];
}


- (IBAction) openDatabase:(id)sender 
{
    NSString *database = [sender titleOfSelectedItem];
    
    if ([sender selectedTag] == 1) {
        [delegate openDatabase: database];
        [sender setTitle: database];
    }
    
}

- (BOOL)validateToolbarItem:(NSToolbarItem *)toolbarItem
{
    return (delegate != nil);
}
@end
