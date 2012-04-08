//
//  OLSettings.h
//  Olifant
//
//  Created by Michael van Tellingen on 4/7/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OLConnection.h"

@interface OLSettings : NSObject

+ (NSMutableArray *)getConnections;
+ (void)addConnection: (OLConnection *)connection;

@end
