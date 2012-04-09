#import <Foundation/Foundation.h>
#import "OLConnection.h"
#import "OLTableResultView.h"

@interface OLTableContentsController : NSObject
{
    IBOutlet OLTableResultView *resultTableController;
    OLConnection *connection;
    NSString *tableName;
    
    int limit;
    int offset;
}

- (id) init;
- (void) selectTable:(NSString *)tableName;
- (void) setConnection:(OLConnection *)newConnection;

@end
