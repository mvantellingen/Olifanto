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
    NSLog(@"Hello from database view");
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

- (BOOL) openDatabase:(NSString *)database
{
    NSArray *tables;
    [connection selectDatabase: database];
    tables = [connection getTables];
    NSLog(@"Tables: %@", tables);
}
@end
