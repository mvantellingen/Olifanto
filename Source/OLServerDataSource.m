#import "OLServerDataSource.h"
#import "OLSettings.h"

@implementation OLServerDataSource

- (id)init 
{
    self = [super init];
    if (self) {
        list = [OLSettings getConnections];
    }
    NSLog(@"Initialized OLServerDataSource");
    return self;
}


@end
