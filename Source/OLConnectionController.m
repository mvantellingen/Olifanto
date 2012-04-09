//
//  OLConnectionController.m
//  PGview
//
//  Created by Michael van Tellingen on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OLConnectionController.h"
#import "OLSettings.h"
#import "OLConnection.h"

@implementation OLConnectionController

@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)awakeFromNib
{
    [connectionSource setDelegate:self];
}


- (IBAction)save:(id)sender
{
    OLConnection *connection = [self _createConnectionInstance];
    [OLSettings addConnection: connection];
}

- (void)selectConnection:(OLConnection *)connection 
{
    [name setStringValue: connection.name];
    [host setStringValue: connection.hostname];
    [username setStringValue: connection.username];
    [password setStringValue: connection.password];
}

- (void)activateConnection:(OLConnection *)connection 
{
    [delegate openConnection:connection];
}

- (IBAction)connect:(id)sender
{
    OLConnection *connection = [self _createConnectionInstance];
    [delegate openConnection: connection];
}

/**
 * Create a connection instance based on the values entered on the form
 */
- (OLConnection *)_createConnectionInstance
{
    if ([[host stringValue] length] == 0) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:@"No host entered"];
        [alert runModal];
        return nil;
    }
    
    OLConnection *connection = [[OLConnection alloc] init];    
    connection.name = [name stringValue];
    connection.hostname = [host stringValue];
    connection.username = [username stringValue];
    connection.password = [password stringValue]; 
    
    return connection;
}

@end
