//
//  OLConnection.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLConnection.h"
#import <PGCconnection.h>
#import <PGCcursor.h>
#import <PGCdescription.h>
#import "OLQueryResult.h"


@implementation OLConnection

@synthesize conn;
@synthesize name;
@synthesize hostname;
@synthesize username;
@synthesize password;


- (id) initWithDictionary:(NSDictionary *)data 
{
    self = [self init];
    if (self != nil) {
        name = [data objectForKey:@"name"];
        hostname = [data objectForKey:@"hostname"];
        username = [data objectForKey:@"username"];
        password = [data objectForKey:@"password"];
    }
    return self;
}

- (NSDictionary *) serialize 
{
    NSDictionary *data = [[NSDictionary alloc] initWithObjectsAndKeys:
                          name, @"name", 
                          hostname, @"hostname",
                          username, @"username",
                          password, @"password",
                          nil];
    
    return data;
}

- (BOOL) connect
{
    return false;
}

- (BOOL) selectDatabase: (NSString *)database
{
    PGCconnection * newConn = [self _connectWithDatabase: database];
    if (newConn == nil) {
        return false;
    }

    // Close the old connection if available
    if (conn) {
        //[conn close];
    }
    conn = newConn;
    
    return true;
}

- (OLQueryResult *) executeQuery:(NSString *)statement
{
    PGCcursor *cursor = [conn cursor];
    NSError *error = nil;
    [cursor execute: statement error:&error]; 
    
    NSLog(@"execute");
    
    // Get the columns names
    NSMutableArray *columns = [NSMutableArray array];
    NSEnumerator *e = [cursor.fields objectEnumerator];
    PGCdescription *field;
    while (field = [e nextObject]) {
        [columns addObject: field.name];
    }
    
    OLQueryResult *result = [[OLQueryResult alloc] init];
    
    result.rows = [cursor fetchAll];
    result.columns = columns;
    NSLog(@"Rows: %@", result.rows);
    NSLog(@"Columns: %@", result.columns);
    
    return result;
}


- (OLQueryResult *) executeQuery:(NSString *)statement withParams:(NSArray *)params
{
    NSLog(@"With params");
}



- (NSArray *) getTables
{
    PGCcursor *cursor;
    
    
    NSError *error = nil;
    cursor = [conn cursor];
    [cursor execute:@"SELECT table_name FROM information_schema.tables " 
                     "WHERE table_schema = 'public' ORDER BY table_name"
              error:&error];  
    
    NSArray *rows = [cursor fetchAll];
    NSArray *row;
    NSMutableArray *tables = [NSMutableArray array];
    
    NSEnumerator *e = [rows objectEnumerator];
    while (row = [e nextObject]) {
        [tables addObject:[row objectAtIndex:0]];
    }
    
    return tables;
}


- (NSArray *) getDatabases
{
    BOOL closeConnection = false;
    PGCcursor *cursor;
    
    if (conn == nil) {
        conn = [self _connectWithDatabase:@"postgres"];
        closeConnection = true;
    }
    
    NSError *error = nil;
    cursor = [conn cursor];
    [cursor execute:@"SELECT datname FROM pg_database ORDER BY datname" 
              error:&error];    
    NSArray *rows = [cursor fetchAll];
    NSArray *row;
    NSMutableArray *databases = [NSMutableArray array];
    
    NSEnumerator *e = [rows objectEnumerator];
    while (row = [e nextObject]) {
        [databases addObject:[row objectAtIndex:0]];
    }
    
    if (closeConnection) {
        [conn close];
    }
    
    return databases;
}

- (PGCconnection *) _connectWithDatabase:(NSString *)theDatabase
{
    NSError *error = nil;
    
    PGCconnection * newConn = [[PGCconnection alloc] init];
    [newConn connect: hostname port: 5432 user: username
            password: nil database: theDatabase error:&error];     
    
    return newConn;
}

@end
