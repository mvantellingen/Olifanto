//
//  OLConnectionSource.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLConnectionOutlineController.h"
#import "OLSettings.h"

@implementation OLConnectionOutlineController

@synthesize delegate;

- (id) init
{
    self = [super init];
    
    connections = [OLSettings getConnections];
    return self;
}

- (void)awakeFromNib {
    [oview setTarget:self];
    [oview setDoubleAction:@selector(doubleClick:)];
}

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

- (void)doubleClick:(id)object {
    NSDictionary *connection = [connections objectAtIndex:[oview selectedRow]];
    [delegate activateConnection:connection];
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