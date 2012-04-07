//
//  OLMainController.h
//  PGview
//
//  Created by Michael van Tellingen on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OLDatabaseController.h"
#import "OLConnectionController.h"

@interface OLMainController : NSViewController 
{
    OLDatabaseController *dbController;
    OLConnectionController *connController;
}

- (void) showDatabaseView;
- (void) showConnectionView;

@end


