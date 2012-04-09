#import "OLSettings.h"
#import "OLConnection.h"

@implementation OLSettings

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

+ (NSMutableArray *)getConnections
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *currentConnectionData = [defaults objectForKey:@"connections"];
    NSMutableArray *connections = [NSMutableArray array];
    
    if (currentConnectionData != nil) {

        NSArray *currentConnections = [NSKeyedUnarchiver 
                                      unarchiveObjectWithData: currentConnectionData];
        
        if (currentConnectionData != nil) {
            NSEnumerator *e = [currentConnections objectEnumerator];
            NSDictionary *item;
            OLConnection *connection;
            NSLog(@"Found %lu items", [currentConnections count]);
            while ((item = [e nextObject]) ) {
                NSLog(@"%@", item);
                connection = [[OLConnection alloc] initWithDictionary:item];
                [connections addObject:connection];
            }
        }
    }
    
    NSLog(@"Returning %lu connections", [connections count]);
    return connections;
}

+ (void)addConnection: (OLConnection *)connection
{
    NSAssert(connection != nil, @"Connection is nil");
    NSMutableArray *connections = [self getConnections];
    [connections addObject:connection];
    NSMutableArray *connectionData = [NSMutableArray array];

    // Serialize the array of connection objects to an array of 
    // dictionaries
    NSEnumerator *e = [connections objectEnumerator];
    OLConnection *item;
    while ((item = [e nextObject]) ) {
        NSLog(@"Serializing %@", item);
        [connectionData addObject:[item serialize]];
    }
    NSLog(@"Current connections is now %lu", [connectionData count]);
    
    // Write the array to the user defaults
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:[NSKeyedArchiver 
                         archivedDataWithRootObject: connectionData] 
                 forKey:@"connections"];
}

@end
