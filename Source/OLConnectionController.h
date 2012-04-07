//
//  OLConnectionController.h
//  PGview
//
//  Created by Michael van Tellingen on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OLConnectionController : NSViewController
{
    id delegate;

    IBOutlet NSTextField *name;
    IBOutlet NSTextField *host;
    IBOutlet NSTextField *username;
    IBOutlet NSTextField *password;


}

- (void)setDelegate:(id)delegate;

- (IBAction)save:(id)sender;
- (IBAction)connect:(id)sender;
@end
