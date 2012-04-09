#import <Cocoa/Cocoa.h>
#import "OLConnectionOutlineController.h"
#import "OLConnection.h"

@interface OLConnectionController : NSViewController
{
    id delegate;

    IBOutlet NSTextField *name;
    IBOutlet NSTextField *host;
    IBOutlet NSTextField *username;
    IBOutlet NSTextField *password;

    IBOutlet OLConnectionOutlineController *connectionSource;

}

@property (nonatomic, assign) id delegate;


- (void)selectConnection:(OLConnection *)connection;
- (void)activateConnection:(OLConnection *)connection ;

- (IBAction)save:(id)sender;
- (IBAction)connect:(id)sender;


- (OLConnection *)_createConnectionInstance;
@end
