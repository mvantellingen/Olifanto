#import "OLTableContentsController.h"

@implementation OLTableContentsController

- (id) init 
{
    self = [super init];
    if (self != nil) {
        limit = 1000;
        offset = 0;
    }
    return self;
}

- (void) setConnection:(OLConnection *)newConnection
{
    connection = newConnection;
}

- (void) selectTable:(NSString *)newTableName
{
    tableName = newTableName;
    [self loadTableContents];
}

- (void) loadTableContents
{
    NSAssert(connection != nil, @"No connection set");
    
    NSString *query = [NSString stringWithFormat:@"SELECT * FROM %s LIMIT %d OFFSET %d",
                       [tableName cStringUsingEncoding:NSUTF8StringEncoding], 
                        limit, offset];
    
    OLQueryResult *result = [connection executeQuery: query];
    
    [resultTableController setQueryResult: result];
}

@end
