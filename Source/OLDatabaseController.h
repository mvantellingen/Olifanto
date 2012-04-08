//
//  OLSchemaController.h
//  PGview
//
//  Created by Michael van Tellingen on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OLConnection.h"

@interface OLDatabaseController : NSViewController
{
    OLConnection *connection;
}
- (void) awakeFromNib;

@end
