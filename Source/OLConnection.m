//
//  OLConnection.m
//  Olifanto
//
//  Created by Michael van Tellingen on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLConnection.h"

@implementation OLConnection
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
@end
