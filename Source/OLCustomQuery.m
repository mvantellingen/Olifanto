#import "OLCustomQuery.h"
#import "OLQueryResult.h"

@implementation OLCustomQuery


- (IBAction) executeQuery:(id)sender
{
    NSAssert(connection != nil, @"No connection set");
    OLQueryResult *result = [connection executeQuery:[textView string]];
    
    [resultTableController setQueryResult: result];

}

- (void) setConnection:(OLConnection *)newConnection
{
    connection = newConnection;
}
@end
