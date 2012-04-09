//
//  OLCustomQuery.h
//  Olifanto
//
//  Created by Michael van Tellingen on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLConnection.h"
#import "OLTableResultView.h"


@interface OLCustomQuery : NSObject
{
    IBOutlet NSString *query;
    IBOutlet NSTextView *textView;
    IBOutlet NSTableView *tableView;
    IBOutlet OLTableResultView *resultTableController;
    OLConnection *connection;
    
}

- (IBAction) executeQuery:(id)sender;

- (void) setConnection:(OLConnection *)newConnection;

@end
