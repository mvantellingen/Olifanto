#import <Cocoa/Cocoa.h>
#import "OLDatabaseController.h"
#import "OLConnectionController.h"

@interface OLMainController : NSViewController 
{
    OLDatabaseController *dbController;
    OLConnectionController *connController;
}

- (void) showDatabaseView;
- (void) showConnectionView;

@end


