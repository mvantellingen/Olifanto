//
//  OLQueryBuilder.h
//  Olifanto
//
//  Created by Michael van Tellingen on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OLQueryBuilder : NSObject
{
    NSMutableArray *selectFields;
    NSMutableArray *fromTables;
    NSMutableArray *whereClauses;
    NSMutableArray *groupByClauses;
    NSMutableArray *orderByClauses;

}

@property (assign) int limit;
@property (assign) int offset;

- (id) init;

- (void) select:(NSMutableArray *)fields;
- (void) from:(NSString *)value;
- (void) filter:(NSString *)clause value:(NSString *)value;

- (NSString *)generate;

@end
