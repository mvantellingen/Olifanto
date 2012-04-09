//
//  OLSchemaController.m
//  PGview
//
//  Created by Michael van Tellingen on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OLDatabaseController.h"
#import "OLConnection.h"

@implementation OLDatabaseController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void) awakeFromNib
{
    [tablesView setDelegate:self];
    NSLog(@"Awak from nib: %@", customQuery);
}

- (void) setConnection:(OLConnection *)newConnection
{
    connection = newConnection;
    [connection connect];
    
    NSLog(@"Set connection");
    [customQuery setConnection:connection];
    [contentsController setConnection:connection];
}

- (void) selectTable:(NSString *)tableName
{
    [contentsController selectTable: tableName];
}

- (NSArray *)getDatabases
{
    return [connection getDatabases];
}

- (NSArray *)getTables
{
    return [connection getTables];
}

- (BOOL) openDatabase:(NSString *)database
{
    currentDatabase = database;
    [connection selectDatabase: database];
    [tablesView update];
    return true;
}

- (void) openQueryView
{
    [tabView selectTabViewItemWithIdentifier:@"query"];
}

- (void) openContentView
{
    [tabView selectTabViewItemWithIdentifier:@"content"];    
}
@end
