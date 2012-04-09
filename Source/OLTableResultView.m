//
//  OLTableResultView.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLTableResultView.h"

@implementation OLTableResultView

- (void) setQueryResult: (OLQueryResult *)theQueryResult
{
    queryResult = theQueryResult;

    // Remove and insert the new columns
    [self _removeColumns];
    NSString *name;
    NSTableColumn *column;
    NSString *identifier;
    for (int i = 0, count = [queryResult.columns count]; i < count; i++) {
        name = [queryResult.columns objectAtIndex:i];
        identifier = [NSString stringWithFormat:@"%d", i];
        column = [[NSTableColumn alloc] initWithIdentifier: identifier]; 

        [[column headerCell] setStringValue: name];
        [tableView addTableColumn: column];
    }
    [tableView reloadData];
}


- (void) _removeColumns 
{
    NSArray *columns = [tableView tableColumns];
    for (int i = [columns count] - 1; i >= 0; i--) {
        [tableView removeTableColumn: [columns objectAtIndex:i]];
    }
}

- (int) numberOfRowsInTableView:(NSTableView *)theTableView
{
    return [queryResult.rows count];
}

- (id) tableView:(NSTableView *)aTableView 
        objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(int)rowIndex 
{
    NSArray *row = [queryResult.rows objectAtIndex:rowIndex];
    int index = [[aTableColumn identifier] intValue];
    return [row objectAtIndex: index];
}


@end
