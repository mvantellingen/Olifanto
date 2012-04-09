//
//  OLTableResultView.h
//  Olifanto
//
//  Created by Michael van Tellingen on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLQueryResult.h"


@interface OLTableResultView : NSObject
{
    OLQueryResult *queryResult;
    IBOutlet NSTableView *tableView;
}


- (void) setQueryResult: (OLQueryResult *)theQueryResult;
- (int) numberOfRowsInTableView:(NSTableView *)theTableView;
- (id) tableView:(NSTableView *)aTableView 
        objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(int)rowIndex;

@end
