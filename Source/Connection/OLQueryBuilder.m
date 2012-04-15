//
//  OLQueryBuilder.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLQueryBuilder.h"
#import "OLQueryResult.h"
#import "OLConnection.h"

@implementation OLQueryBuilder

@synthesize limit;
@synthesize offset;

- (id) init
{
    self = [super init];
    if (self != nil) {
        selectFields = [NSMutableArray array];
        fromTables = [NSMutableArray array];

        self.limit = 0;
        self.offset = 0;
    }
    return self;
}

- (void) select:(NSMutableArray *)fields
{
    NSEnumerator *e = [fields objectEnumerator];
    NSString *item;
    while (item = [e nextObject]) {
        [selectFields addObject: item];
    }
}

- (void) from:(NSString *)value
{
    [fromTables addObject:value];
}


- (void) filter:(NSString *)clause value:(NSString *)value
{
    
}


- (NSString *)generate
{
    NSMutableArray *parts = [NSMutableArray array];
    NSString *buffer;
    
    if ([selectFields count] > 0) {
        buffer = [NSString stringWithFormat:@"SELECT %s",
                  [selectFields componentsJoinedByString:@", "]];
        [parts addObject:buffer];
    }
    else {
        [parts addObject:@"SELECT *"];
    }

    if ([fromTables count] > 0) {
        buffer = [NSString stringWithFormat:@"FROM %@",
                  [fromTables componentsJoinedByString:@", "]];
        [parts addObject:buffer];
    }

    if ([whereClauses count] > 0) {
        buffer = [NSString stringWithFormat:@"WHERE %@",
                  [selectFields componentsJoinedByString:@" AND "]];
        [parts addObject:buffer];
    }
    
    if (limit > 0) {
        buffer = [NSString stringWithFormat:@"LIMIT %d", limit];
        [parts addObject:buffer];
    }

    if (offset > 0) {
        buffer = [NSString stringWithFormat:@"OFFSET %d", offset];
        [parts addObject:buffer];
    }
    
    return [parts componentsJoinedByString: @" "];
}

- (OLQueryResult *)execute: (OLConnection *)connection
{
    NSString *query = [self generate];
    NSMutableArray *params = [NSMutableArray array];
    return [connection executeQuery:query withParams: params];
}
                   
@end
