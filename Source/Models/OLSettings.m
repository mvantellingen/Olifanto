//
//  OLSettings.m
//  Olifant
//
//  Created by Michael van Tellingen on 4/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "OLSettings.h"

@implementation OLSettings

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (NSMutableArray *)getServers
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *currentServersData = [defaults objectForKey:@"servers"];
    NSMutableArray *servers;
    
    if (currentServersData != nil) {
        NSArray *currentServers = [NSKeyedUnarchiver 
                                   unarchiveObjectWithData:currentServersData];
        if (currentServersData != nil) {
            servers = [[NSMutableArray alloc] initWithArray:currentServers];
        }
        else {
            servers = [[NSMutableArray alloc] init];
        }        
    }
    else {
        servers = [[NSMutableArray alloc] init];        
    }
    return servers;
}

+ (void)addServer: (NSDictionary *)serverData
{
    NSMutableArray *servers = [self getServers];
    [servers addObject:serverData];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver archivedDataWithRootObject:servers] 
                 forKey:@"servers"];
}

@end
