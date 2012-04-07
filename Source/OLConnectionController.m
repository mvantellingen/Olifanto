//
//  OLConnectionController.m
//  PGview
//
//  Created by Michael van Tellingen on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OLConnectionController.h"
#import "OLSettings.h"

@implementation OLConnectionController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)setDelegate:(id)theDelegate
{
    delegate = theDelegate;
}


- (IBAction)save:(id)sender
{
    if ([[host stringValue] length] == 0) {
        NSAlert *alert = [[NSAlert alloc] init];
        [alert setMessageText:@"No host entered"];
        [alert runModal];
        return;
    }
    
    NSDictionary *data = [NSDictionary dictionaryWithObjectsAndKeys:
                          [name stringValue], @"name", 
                          [host stringValue], @"host", 
                          [username stringValue], @"username", 
                          [password stringValue], @"password", 
                          nil];
    [OLSettings addServer: data];
}

- (IBAction)connect:(id)sender
{
    NSLog(@"Connect to db");
   // [delegate showDatabaseView];
}

@end
