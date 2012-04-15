//
//  OLTableContentsDatasource.h
//  Olifanto
//
//  Created by Michael van Tellingen on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLConnection.h"

@interface OLTableContentsDatasource : NSObject
{
    NSArray *rows;
    NSArray *columns;
    int pageSize;
}


- (void) setPageSize:(int)num;
- (void) setPage:(int)newPageNum;
- (NSArray *) getColumns;

@property (assign) OLConnection *connection;
@property (assign) NSString *tableName;
@property (assign) int pageNum;

@end
