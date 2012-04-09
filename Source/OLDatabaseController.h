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
#import "OLCustomQuery.h"


@interface OLDatabaseController : NSViewController
{
    OLConnection *connection;
    NSString *currentDatabase;
    IBOutlet OLTableOutlineView *tablesView;
    IBOutlet NSTabView *tabView;
    IBOutlet OLCustomQuery *customQuery;
}
- (void) awakeFromNib;

- (void) openQueryView;
- (void) openContentView;
- (BOOL) openDatabase:(NSString *)database;
- (void) setConnection:(OLConnection *)newConnection;


@property (nonatomic, assign) id delegate;

@end
