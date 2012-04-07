//
//  OLServerTableView.m
//  Olifant
//
//  Created by Michael van Tellingen on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OLServerDataSource.h"
#import "OLSettings.h"

@implementation OLServerDataSource

- (id)init 
{
    self = [super init];
    if (self) {
        list = [OLSettings getServers];
    }
    NSLog(@"Initialized OLServerDataSource");
    return self;
}


@end
