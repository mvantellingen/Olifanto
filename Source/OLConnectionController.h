//
//  OLConnectionController.h
//  PGview
//
//  Created by Michael van Tellingen on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OLConnectionSource.h"
#import "OLConnection.h"

@interface OLConnectionController : NSViewController
{
    id delegate;

    IBOutlet NSTextField *name;
    IBOutlet NSTextField *host;
    IBOutlet NSTextField *username;
    IBOutlet NSTextField *password;

    IBOutlet OLConnectionSource *connectionSource;

}

@property (nonatomic, assign) id delegate;


- (void)selectConnection:(OLConnection *)connection;
- (void)activateConnection:(OLConnection *)connection ;

- (IBAction)save:(id)sender;
- (IBAction)connect:(id)sender;


- (OLConnection *)_createConnectionInstance;
@end
