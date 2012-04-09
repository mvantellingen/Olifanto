#import <Foundation/Foundation.h>
#import "OLConnection.h"

@interface OLSettings : NSObject

+ (NSMutableArray *)getConnections;
+ (void)addConnection: (OLConnection *)connection;

@end
