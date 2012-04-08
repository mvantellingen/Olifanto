//
//  OLSchemaController.h
//  PGview
//
//  Created by Michael van Tellingen on 11/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OLConnection.h"
#import "OLTableOutlineView.h"

@interface OLDatabaseController : NSViewController
{
    OLConnection *connection;
    IBOutlet OLTableOutlineView *tablesView;
}
- (void) awakeFromNib;

@property (nonatomic, assign) id delegate;

@end
