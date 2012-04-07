//
//  OLServerTableView.h
//  Olifant
//
//  Created by Michael van Tellingen on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OLServerDataSource : NSObject <NSOutlineViewDataSource> {
    
@private

    IBOutlet NSOutlineView *view;
    NSMutableArray *list;
} @end
