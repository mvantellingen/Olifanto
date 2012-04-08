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
}

- (void) setConnection:(OLConnection *)newConnection
{
    connection = newConnection;
    [connection connect];
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
    NSArray *tables;
    [connection selectDatabase: database];
    [tablesView update];
    return true;
}
@end
