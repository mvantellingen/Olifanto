//
//  OLTableOutlineView.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLTableOutlineView.h"

@implementation OLTableOutlineView

- (int) outlineView:(id)oview numberOfChildrenOfItem:(id)item
{
    if (item == nil) {
        return [connections count];
    }
    return 0;
}

- (IBAction)click:(id)sender {
    NSDictionary *connection = [connections objectAtIndex:[oview selectedRow]];
    [delegate selectConnection:connection];
}

-(id) outlineView:(id)oview child:(int)childnum ofItem:(id)item
{
    return [connections objectAtIndex:childnum];
}

-(bool) outlineView:(id)oview isItemExpandable:(id)item
{
    return NO;
}

-(id) outlineView:(id)oview objectValueForTableColumn:(id)tableColumn byItem:(id)item
{
    return [item name];
}

@end
