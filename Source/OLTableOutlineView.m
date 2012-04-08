//
//  OLTableOutlineView.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLTableOutlineView.h"

@implementation OLTableOutlineView
@synthesize delegate;

- (void) update
{
    tables = [delegate getTables];
    [oview reloadData];
}

- (int) outlineView:(id)oview numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [tables count];
    }
    return 0;
}

- (IBAction)click:(id)sender {
    NSString *table = [tables objectAtIndex:[oview selectedRow]];
    [delegate selectTable:table];
}

-(id) outlineView:(id)oview child:(int)childnum ofItem:(id)item
{
    return [tables objectAtIndex:childnum];
}

-(bool) outlineView:(id)oview isItemExpandable:(id)item
{
    return NO;
}

-(id) outlineView:(id)oview objectValueForTableColumn:(id)tableColumn byItem:(id)item
{
    return item;
}

@end
