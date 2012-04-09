//
//  OLCustomQuery.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLCustomQuery.h"
#import "OLQueryResult.h"

@implementation OLCustomQuery


- (IBAction) executeQuery:(id)sender
{
    NSAssert(connection != nil, @"No connection set");
    OLQueryResult *result = [connection executeQuery:[textView string]];
    
    [resultTableController setQueryResult: result];

}

- (void) setConnection:(OLConnection *)newConnection
{
    connection = newConnection;
}
@end
