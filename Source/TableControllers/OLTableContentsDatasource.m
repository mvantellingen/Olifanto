//
//  OLTableContentsDatasource.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLTableContentsDatasource.h"
#import "OLQueryBuilder.h"
#import "OLQueryResult.h"

@implementation OLTableContentsDatasource

@synthesize connection;
@synthesize tableName;
@synthesize pageNum;

- (void) awakeFromNib
{
    pageSize = 1000;
    pageNum = 0;
}

- (void) setPageSize:(int)newPageSize
{
    pageSize = newPageSize;
}


- (void) reloadData
{
    OLQueryBuilder *builder = [[OLQueryBuilder alloc] init];
    [builder from: tableName];
    [builder setLimit: pageSize];
    [builder setOffset: pageSize * pageNum];
    
    OLQueryResult *result = [builder execute: connection];
    rows = result.rows;
    columns = result.columns;
    
}

- (void )setTableName:(NSString *)newTableName
{
    if (tableName == nil || ![tableName isEqualToString:newTableName]) {
        tableName = newTableName;
        pageSize = 1000;
        pageNum = 0;
    }
}


- (NSArray *)getColumns
{
    return columns;
}

- (int) numberOfRowsInTableView:(NSTableView *)theTableView
{
    NSLog(@"Returning row count in datasource");
    return [rows count];
}


- (id) tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(int)rowIndex 
{
    NSArray *row = [rows objectAtIndex:rowIndex];
    int index = [[aTableColumn identifier] intValue];
    return [row objectAtIndex: index];
}


@end
